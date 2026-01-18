import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.taxes,
    required this.fees,
    required this.total,
  });

  final num order;
  final num taxes;
  final num fees;
  final num total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h ,horizontal: 8.w),
      child: Column(
        children: [
          _CheckoutRow(title: 'Order', value: order),
          SizedBox(height: 8.h),
          _CheckoutRow(title: 'Taxes', value: taxes),
          SizedBox(height: 8.h),
          _CheckoutRow(title: 'Total Price With Tax', value: fees),
          SizedBox(height: 8.h),
          const Divider(),
          SizedBox(height: 8.h),
          _CheckoutRow(
            title: 'Total:',
            value: total,
            isBold: true,
            isSmall: false,
          ),
        ],
      ),
    );
  }
}


class _CheckoutRow extends StatelessWidget {
  const _CheckoutRow({
    required this.title,
    required this.value,
    this.customText,
    this.isBold = false,
    this.isSmall = true,
  });

  final String title;
  final num value;
  final String? customText;
  final bool isBold;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final displayValue =
        customText ?? "\$${value.toStringAsFixed(2)}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          size: isSmall ? 18 : 21,
          weight: isBold ? FontWeight.bold : FontWeight.w400,
          color: isBold ? Colors.black : Colors.grey.shade600,
        ),
        CustomText(
          text: displayValue,
          size: isSmall ? 18 : 21,
          weight: isBold ? FontWeight.bold : FontWeight.w400,
          color: isBold ? Colors.black : Colors.grey.shade600,
        ),
      ],
    );
  }
}
