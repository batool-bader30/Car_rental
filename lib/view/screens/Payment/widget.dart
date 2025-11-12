import 'package:carrental/controllers/patment_provider.dart';
import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
      builder: (context, provider, _) {
        return ListView.builder(
          shrinkWrap: true, // عشان يتأقلم داخل Column
          physics: BouncingScrollPhysics(), // يسمح بالتمرير
          itemCount: provider.paymentMethods.length,
          itemBuilder: (context, index) {
            bool isSelected = provider.selectedIndex == index;
            return GestureDetector(
              onTap: () => provider.selectPaymentMethod(index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      index == 0 ? Assets.card : Assets.cash,
                      height: 26,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        provider.paymentMethods[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff0F0E0E),
                        ),
                      ),
                    ),
                    // الدائرة
                    Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // الدائرة الخارجية
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.amber
                                    : Colors.grey,
                                width: 1,
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                          // الدائرة الداخلية
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.amber
                                    : Colors.grey,
                                width: 1,
                              ),
                              color: isSelected ? AppColor.amber : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
