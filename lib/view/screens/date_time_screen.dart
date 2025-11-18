import 'package:carrental/controllers/booking_provider.dart';
import 'package:carrental/models/booking_model.dart';
import 'package:carrental/models/car_model.dart';
import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/utils/validations/exptions%20(1).dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/text_field.dart';
import 'package:flutter/material.dart' hide TextField;
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class DateTimeScreen extends StatefulWidget {
  final CarModel car;
  const DateTimeScreen({super.key, required this.car});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  final TextEditingController hoursController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedPeriod = "AM";

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

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      if (selectedDate == null || selectedTime == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Please select date and time")));
        return;
      }
      print("Date:$selectedDate");
      print("Date:$selectedTime $selectedPeriod");
      print("Hours:${hoursController.text}");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data validated successfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    //final BookingProvider= Provider.of<BookingProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: IconWidget(icon: Icons.arrow_back),
                  ),
                  Text(
                    "Date & Time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconWidget(icon: Icons.favorite_border),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.car.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.car.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "\$${widget.car.price}/Day",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //black box
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                //padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Date ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: _pickDate,
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 16),
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: AppColor.primary,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  selectedDate == null
                                      ? "Enter Date"
                                      : DateFormat(
                                          'yyyy-MM-dd',
                                        ).format(selectedDate!),
                                  style: TextStyle(color: AppColor.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: _pickTime,
                                child: Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 16),
                                      Icon(
                                        Icons.access_time,
                                        color: AppColor.primary,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        selectedTime == null
                                            ? "Enter Time"
                                            : selectedTime!.format(context),
                                        style: TextStyle(
                                          color: AppColor.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Total Hours",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        HourstTextField(hoursController: hoursController),
                        SizedBox(height: 50),
                        Button(
                          title: "Next",
                          ontap: () async {
                            if (_formKey.currentState!.validate() &&
                                selectedDate != null &&
                                selectedTime != null) {
                              final booking = BookingModel(
                                carName: widget.car.name,

                                date: DateFormat('yyyy-MM-dd').format(selectedDate!),
                                time: selectedTime!.format(context),
                                hours: int.parse(hoursController.text),
                              );

                              await Provider.of<BookingProvider>(
                                context,
                                listen: false,
                              ).addBooking(booking);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Booking saved successfully!"),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please fill all fields"),
                                ),
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
