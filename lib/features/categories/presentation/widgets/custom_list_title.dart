import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';

class AppHeaderCustom extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imagePath;
  final VoidCallback? onActionTap;

  const AppHeaderCustom({
    super.key,
    required this.title,
    required this.imagePath,
    this.subtitle,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 30.0.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 👉 leading image
          CachedNetworkImage(
            imageUrl: imagePath,
            height: 100.w,
            width: 100.w,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),

                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (_, _) =>
            const CircularProgressIndicator(strokeWidth: 2),
            errorWidget: (_, _, _) => const Icon(Icons.error),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.black,
                    ),
                  ),
                ],
              ],
            ),
          ),

          if (onActionTap != null)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                height: 50.h,
                width: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColors.red,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
