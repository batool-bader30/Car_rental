import 'package:carrental/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';


class UserController extends ChangeNotifier {
  UserModel? userModel;
 final ImagePicker _picker = ImagePicker();

  //for image uplod
  Future<void> pickImageAndSave() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (userModel == null) userModel = UserModel(name: '' , email: '');
      userModel!.image = pickedFile.path;
      notifyListeners();
    }
  }
  /// register
  Future<String?> createUser(String email, String password) async {
    try {
      final query = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email.trim())
          .get();

      if (query.docs.isNotEmpty) {
        return "Username already exists";
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      if (userCredential.user != null) {
        await saveUid(userCredential.user!.uid);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
              "email": email?.trim(),
              "name": null,
              "phoneNumber": null,
              "lastdate": DateTime.now(),
            }, SetOptions(merge: true));
        getinfo();
        notifyListeners();
        return "";
      }
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

  /// login
  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await saveUid(userCredential.user!.uid);
      getinfo();
      return userCredential.user != null;
    } catch (e) {
      return false;
    }
  }

  /// save uid
  Future<void> saveUid(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
  }

  ///get uid
  Future<String?> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  /// logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
    userModel = null;
    notifyListeners();
  }

  /// save user data in firestore
  Future<void> saveUserData({String? name, String? phoneNumber,String? image,String? gender}) async {
    final String? uid = await getUid();
    if (uid != null) {
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "name": name?.trim(),
        "phoneNumber": phoneNumber?.trim(),
        "image": image?.trim(),
        "gender":gender?.trim(),
        "lastdate": DateTime.now(),
      }, SetOptions(merge: true));
    }
  }

  Future<void> getinfo() async {
    final String? uid = await getUid();
    if (uid != null) {
      var doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get();
      if (doc.exists && doc.data() != null) {
        userModel = UserModel.fromJson(doc.data()!);
        notifyListeners();
      }
    }
  }

  Future<bool> sendPasswordReset(String email) async {
    final query = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email.trim())
        .get();
    if (query.docs.isNotEmpty) {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      return true;
    } else
     { return false;}
  }
}
