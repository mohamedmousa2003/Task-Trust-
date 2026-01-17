import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_trust_development/core/styles/colors.dart';
import 'package:task_trust_development/core/styles/styles.dart';
import '../../../../core/components/custom_cached_circleImage.dart';
import '../../data/models/categories_dto.dart';

class CustomListHeaderCategories extends StatefulWidget {
  final List<DtoCategories> categories;
  final Function(DtoCategories)? onTapItem;

  const CustomListHeaderCategories({
    super.key,
    required this.categories,
    this.onTapItem,
  });

  @override
  State<CustomListHeaderCategories> createState() => _CustomListHeaderCategoriesState();
}

class _CustomListHeaderCategoriesState extends State<CustomListHeaderCategories> {
  String? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: widget.categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = category.id.toString() == selectedCategoryId;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryId = category.id.toString();
              });
              if (widget.onTapItem != null) widget.onTapItem!(category);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? MyColors.red : MyColors.redUnSelect,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomCachedCircleImage(imageUrl: category.image ?? ""),
                  SizedBox(width: 8.w),
                  Text(
                    category.nameEn ?? "",
                    style: isSelected ? AppTextStyles.textStyle18 : AppTextStyles.textStyle18.copyWith(
                      color: MyColors.grey
                    )
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
