import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/constant/images_assets.dart';
import '../../../../core/enum/enum_language.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';
import '../../../cart/data/models/add_cart.dart';
import '../../../cart/presentation/viow_model/cubit/add_to_cart_cubit.dart';
import '../../../profile/presentation/view_model/lanage_cubit.dart';
import 'custom_list_title.dart';

class ProductList extends StatelessWidget {
  final dynamic category;
  const ProductList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = category.products as List<dynamic>?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// ===== Header =====
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Text(
            context.watch<LanguageCubit>().state == Language.en
                ? category.nameEn
                : category.nameAr,
            style: const TextStyle(fontSize: 20),
          ),
        ),

        /// ===== Products =====
        Expanded(
          child: products == null || products.isEmpty
              ? Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AnimationGif.emptyBox),
              Text("No products found",style: AppTextStyles.textStyle20.copyWith(
    color: MyColors.darkBrown,
    fontWeight: FontWeight.bold,
    ),),
                ],
              ))
              : ListView.builder(
            padding:
            EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return AppHeaderCustom(
                title:
                context.watch<LanguageCubit>().state == Language.en ? product.nameEn : product.nameAr,
                subtitle: product.price?.toString() ?? '',
                imagePath: product.image,

                onActionTap: () {
                  final addCart = AddCart(
                    guestId: EndPoints.guestId, // لازم يكون مش null
                    items: [
                      Items(
                          productId: product.id,
                          quantity: 1,
                          addons: [
                            Addons(
                              name: product.name,
                              id: product.id,
                              price: product.price,
                            )
                          ]
                      )
                    ],
                  );
                  context.read<AddToCartCubit>().addCart(addCart);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
