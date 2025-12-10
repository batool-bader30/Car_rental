import 'package:carrental/controllers/booking_provider.dart';
import 'package:carrental/models/booking_model.dart';
import 'package:carrental/models/car_model.dart';
import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/utils/stripe_payment/payment_manage.dart';
import 'package:carrental/utils/validations/exptions%20(1).dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeScreen extends StatefulWidget {
  final CarModel car;
  const DateTimeScreen({super.key, required this.car});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  final TextEditingController DaysController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) setState(() => selectedDate = date);
  }

  Future<void> _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) setState(() => selectedTime = time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: IconWidget(icon: Icons.arrow_back),
                  ),
                  Text(
                    "Date & Time",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  IconWidget(icon: Icons.favorite_border),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 190.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: NetworkImage(widget.car.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.car.name,
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${widget.car.price}/Day",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(18.w),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          "Date ",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: _pickDate,
                          child: Container(
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 16.w),
                                Icon(Icons.calendar_month_outlined, color: AppColor.primary),
                                SizedBox(width: 12.w),
                                Text(
                                  selectedDate == null
                                      ? "Enter Date"
                                      : DateFormat('yyyy-MM-dd').format(selectedDate!),
                                  style: TextStyle(color: AppColor.primary, fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: _pickTime,
                                child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 16.w),
                                      Icon(Icons.access_time, color: AppColor.primary),
                                      SizedBox(width: 12.w),
                                      Text(
                                        selectedTime == null
                                            ? "Enter Time"
                                            : selectedTime!.format(context),
                                        style: TextStyle(color: AppColor.primary, fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "Total Days",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        DaystTextField(DaysController: DaysController),
                        SizedBox(height: 30.h),
                        Button(
                          title: "Next",
                          ontap: () async {
                            if (_formKey.currentState!.validate() &&
                                selectedDate != null &&
                                selectedTime != null) {
                              final booking = BookingModel(
                                ispaid: false,
                                carId: widget.car.id,
                                carName: widget.car.name,
                                userId: FirebaseAuth.instance.currentUser!.uid,
                                date: DateFormat('yyyy-MM-dd').format(selectedDate!),
                                time: selectedTime!.format(context),
                                Days: int.parse(DaysController.text),
                                totalprice: (double.parse(DaysController.text) * widget.car.price).toInt(),
                              );

                              await Provider.of<BookingProvider>(context, listen: false)
                                  .addBooking(booking);
                              NavigatorUtils.navigateToPaymentmethodScreen(context, booking);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please fill all fields")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
