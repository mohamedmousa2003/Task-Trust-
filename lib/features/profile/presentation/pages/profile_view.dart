import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_trust_development/core/styles/colors.dart';
import 'package:task_trust_development/core/styles/styles.dart';

import '../../../../core/enum/enum_language.dart';
import '../view_model/lanage_cubit.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.all(8.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglish ? "Language" : "اللغة",
                    style: AppTextStyles.textStyle24.copyWith(
                      color: MyColors.darkBrown,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 12.h),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isEnglish = true;
                          context.read<LanguageCubit>().changeLanguage(Language.en);
                        });
                      },
                      child: _buildLanguageOption(
                          title: "English", code: "EN", selected: isEnglish)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isEnglish = false;
                          context.read<LanguageCubit>().changeLanguage(Language.ar);
                        });
                      },
                      child: _buildLanguageOption(
                          title: "العربية", code: "AR", selected: !isEnglish)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.redUnSelect,
        borderRadius: BorderRadius.circular(12.r),

      ),
      child: child,
    );
  }

  Widget _buildLanguageOption({
    required String title,
    required String code,
    required bool selected,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: selected ? Colors.orange[50] : Colors.grey[100],
        border: Border.all(
            color: selected ? Colors.orange : Colors.grey[300]!, width: 1.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:  AppTextStyles.textStyle20.copyWith(
                  color: MyColors.darkBrown,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w400
              ) ),
          Text(code,
              style:  AppTextStyles.textStyle18.copyWith(
                  color: MyColors.darkBrown,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w400
              )),
        ],
      ),
    );
  }
}
