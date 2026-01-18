import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/styles.dart';
import '../../../di/injectable.dart';
import '../../cart/presentation/pages/product_screen.dart';
import '../../cart/presentation/viow_model/cubit/get_cart_cubit.dart';
import '../navigation_screens.dart';
import '../view_model/navigation_bar_cubit.dart';

class NavigationBarScreen extends StatelessWidget {

  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBarCubit(),
      child: const _NavigationBarView(),
    );
  }
}

class _NavigationBarView extends StatelessWidget {
  const _NavigationBarView({super.key});

  static const List<_NavItem> _navItems = [
    _NavItem(icon: Icons.category, label: 'Categories'),
    _NavItem(icon: Icons.person, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex =  context.select((NavigationBarCubit c) => c.currentIndex);

    return Scaffold(
      extendBody: true,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _FabButton(
        onTap: () => _builderSowTak(context),
      ),

      body: IndexedStack(
        index: currentIndex,
        children: navigationScreens,
      ),


      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0,
        elevation: 10,
        color: MyColors.background,
        child: SizedBox(
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              final isSelected = currentIndex == index;

              return GestureDetector(
                onTap: () => context.read<NavigationBarCubit>().changeIndex(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 30,
                      color: isSelected
                          ? MyColors.darkBrown
                          : MyColors.grey,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item.label,
                      style:AppTextStyles.textStyle13.copyWith(
                        fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected ? MyColors.darkBrown : MyColors.grey,
                      )
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _builderSowTak(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => BlocProvider(
          create: (BuildContext context)=>getIt.get<GetCartCubit>()..getCart(),
          child: const ProductScreen()),
    );
  }
}


class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.label,
  });
}


class _FabButton extends StatelessWidget {
  final VoidCallback onTap;

  const _FabButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 90.w,
          height: 90.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.grey.withOpacity(0.15),
          ),
        ),


        Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.grey.withOpacity(0.25),
          ),
        ),


        FloatingActionButton(
          elevation: 0,
          backgroundColor: MyColors.darkBrown,
          onPressed: onTap,
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
