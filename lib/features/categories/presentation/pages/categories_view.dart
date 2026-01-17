import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_trust_development/di/injectable.dart';

import '../cubit/categories_cubit.dart';
import '../widgets/custom_list_hader_categorie.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesCubit>()..fetchCategories(), // call fetch on creation
      child: Scaffold(
        body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoriesLoaded) {
              return Column(
                children: [
                  SizedBox(height: 30.h),
                  CustomListHeaderCategories(
                    categories: state.categories,
                    onTapItem: (category) {},
                  ),
                  // لو عايز تعرض القائمة تحت
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(category.image ??""),
                          ),
                          title: Text(category.nameAr ??""),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is CategoriesEmpty) {
              return const Center(child: Text("No categories available"));
            } else if (state is CategoriesError) {
              return Center(child: Text(state.failure.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
