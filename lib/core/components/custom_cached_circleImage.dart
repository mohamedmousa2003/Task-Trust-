import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedCircleImage extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const CustomCachedCircleImage({
    super.key,
    required this.imageUrl,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    final hasValidImage = imageUrl != null && imageUrl!.isNotEmpty;

    return SizedBox(
      height: size.w,
      width: size.w,
      child: ClipOval(
        child: hasValidImage
            ? CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: SizedBox(
              height: 20.w,
              width: 20.w,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (context, url, error) => _errorWidget(),
        )
            : _errorWidget(),
      ),
    );
  }

  Widget _errorWidget() {
    return Container(
      color: Colors.grey.shade200,
      child: Icon(
        Icons.image_not_supported,
        color: Colors.grey,
        size: 24.sp,
      ),
    );
  }
}
