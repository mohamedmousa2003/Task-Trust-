import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/styles/app_dailog.dart';
import '../../../../core/styles/colors.dart';
import '../../data/models/delete_cart.dart';
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

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCartCubit, GetCartState>(

      listener: (context, state) {

        if (state is DeleteCartLoaded) {
          AppDialog.showSnackBar(context, "Item removed successfully") ;

        }

        // Listener for errors
        if (state is GetCartError) {
          AppDialog.showSnackBar(context, state.message) ;

        }
      },
      builder: (context, state) {
        if (state is GetCartLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(
             color: MyColors.darkBrown,
            )),
          );
        }

        if (state is GetCartError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }

        if (state is GetCartLoaded) {
          final cart = state.carts;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                const Divider(),
                Expanded(
                  child: cart.cartItems == null || cart.cartItems!.isEmpty
                      ? const Center(child: Text("No items in cart"))
                      : ListView.builder(
                    itemCount: cart.cartItems!.length,
                    itemBuilder: (context, index) {
                      final item = cart.cartItems![index];
                      return CartItem(
                        isLoading: true,
                        image: item.image ?? "",
                        text: item.productName ?? "",
                        desc: item.price ?? "",
                        number: item.quantity ?? 0,
                        onRemove: () {
                          DeleteCart delete = DeleteCart(
                            quantity: item.quantity,
                            productId: item.productId,
                            guestId: EndPoints.guestId,
                          );
                          context.read<GetCartCubit>().delete(delete);
                        },
                        onAdd: () {},
                        onMin: () {},
                      );
                    },
                  ),
                ),
                SizedBox(height: 100.h,),
              ],
            ),
            bottomSheet: cart.cartItems != null && cart.cartItems!.isNotEmpty
                ? Container(
              width: double.infinity,
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 3),
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
                          text: '\$${state.carts.totalPrice}',
                          size: 25,
                          weight: FontWeight.bold,
                          color: MyColors.darkBrown,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      widget: Icon(
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
                              getCart: state.carts,
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

        // fallback UI
        return Scaffold(
          body: const Center(child: Text("No Data")),
        );
      },
    );
  }
}
