import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_trust_development/core/styles/colors.dart';
import 'package:task_trust_development/di/injectable.dart';
import '../cubit/categories_cubit.dart';
import '../widgets/custom_list_hader_categorie.dart';
import '../widgets/product_list.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with SingleTickerProviderStateMixin {
  late CategoriesCubit cubit;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    cubit = getIt<CategoriesCubit>()..fetchCategories();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _initTabController(int length) {
    // لو مش موجود أو الطول مختلف، نعمله init جديد
    if (_tabController == null || _tabController!.length != length) {
      _tabController?.dispose();
      _tabController = TabController(length: length, vsync: this);
      _tabController!.addListener(() {
        setState(() {}); // عشان الـ selected highlight يتغير
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator(
              color: MyColors.darkBrown,
            ));
          } else if (state is CategoriesLoaded) {
            final categories = state.categories;
            _initTabController(categories.length);

            return Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 50.h),

                  /// ===== Header Categories =====
                  CustomListHeaderCategories(
                    categories: categories,
                    onTapItem: (category) {
                      final index = categories.indexOf(category);
                      _tabController!.animateTo(index);
                    },
                  ),

                  SizedBox(height: 16.h),

                  /// ===== Products =====
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: categories
                          .map((category) => ProductList(category: category))
                          .toList(),
                    ),
                  ),

                  SizedBox(height: 150.h),
                ],
              ),
            );
          } else if (state is CategoriesError) {
            return Center(child: Text(state.failure.message));
          }

          return Container();
        },
      ),
    );
  }
}
