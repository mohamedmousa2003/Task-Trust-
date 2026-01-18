import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../data/models/get_cart.dart';
import '../widgets/custom_text.dart';
import '../widgets/order_details_widget.dart';

class CheckScreen extends StatelessWidget {
  final GetCartModel getCart;
  const CheckScreen({super.key,required this.getCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Order summary',
              size: 22,
              weight: FontWeight.bold,
              color: MyColors.darkBrown,
            ),
            SizedBox(height: 10.h,),

            OrderDetailsWidget(
              order:  double.parse(getCart.totalPoints ?? "0"),
              taxes: double.parse(getCart.vat ??""),
              fees: double.parse(getCart.totalPrice ??""),
              total: double.parse(getCart.totalPriceWithTax ??""),
            ),

            _ConfirmButton(),
          ],
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.darkBrown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Confirm Order',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


