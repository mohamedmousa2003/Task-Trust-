import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/images_assets.dart';
import '../../../../core/enum/enum_language.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/styles.dart';
import '../../../profile/presentation/view_model/lanage_cubit.dart';
import '../viow_model/cubit/get_cart_cubit.dart';
import '../widgets/cart_item.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'check_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCartCubit, GetCartState>(
      listener: (context, state) {
        if (state is GetCartError) {
          AppDialog.showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        /// Loading
        if (state is GetCartLoading) {
          return Scaffold(
            body: Center(
              child: Image.asset(
                AnimationGif.loading,
                height: 200.h,
                width: 200.w,
                color: MyColors.darkBrown,
              ),
            ),
          );
        }

        /// Error
        if (state is GetCartError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }

        /// Loaded
        if (state is GetCartLoaded) {
          final cart = state.carts;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                const Divider(),
                Expanded(
                  child: cart.cartItems == null || cart.cartItems!.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AnimationGif.emptyBox),
                        Text(
                          "No items in cart",
                          style: AppTextStyles.textStyle20.copyWith(
                            color: MyColors.darkBrown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                      : ListView.builder(
                    itemCount: cart.cartItems!.length,
                    itemBuilder: (context, index) {
                      final item = cart.cartItems![index];

                      final int currentQty =
                      (item.quantity ?? 0).toInt();

                      return CartItem(
                        isLoading: state is GetCartLoading,
                        image: item.image ?? "",
                        text: context.watch<LanguageCubit>().state ==
                            Language.en
                            ? (item.productNameEn ?? '')
                            : (item.productNameAr ?? ''),
                        desc: item.price ?? "",
                        number: currentQty,

                        /// ❌ Delete
                        onRemove: () {
                          context.read<GetCartCubit>().updateQuantity(
                            productId: item.productId!,
                            quantity: 0,
                          );
                        },

                        /// ➕ Add
                        onAdd: () {
                          context.read<GetCartCubit>().updateQuantity(
                            productId: item.productId!,
                            quantity: currentQty + 1,
                          );
                        },

                        /// ➖ Min
                        onMin: () {
                          if (currentQty > 1) {
                            context.read<GetCartCubit>().updateQuantity(
                              productId: item.productId!,
                              quantity: currentQty - 1,
                            );
                          } else {
                            context.read<GetCartCubit>().updateQuantity(
                              productId: item.productId!,
                              quantity: 0,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 100.h),
              ],
            ),

            /// Bottom Sheet
            bottomSheet: cart.cartItems != null &&
                cart.cartItems!.isNotEmpty
                ? Container(
              width: double.infinity,
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Total',
                          size: 22,
                          weight: FontWeight.bold,
                          color: MyColors.darkBrown,
                        ),
                        CustomText(
                          text: '\$${cart.totalPrice}',
                          size: 25,
                          weight: FontWeight.bold,
                          color: MyColors.darkBrown,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      widget: const Icon(
                        CupertinoIcons.money_dollar,
                        color: MyColors.white,
                        size: 30,
                      ),
                      gap: 10,
                      height: 48,
                      color: MyColors.darkBrown,
                      textColor: Colors.white,
                      text: 'Checkout',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CheckScreen(
                              getCart: cart,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
                : null,
          );
        }

        return const Scaffold(
          body: Center(child: Text("No Data")),
        );
      },
    );
  }
}
