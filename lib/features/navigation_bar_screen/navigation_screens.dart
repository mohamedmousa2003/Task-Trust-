import 'package:flutter/material.dart';
import 'package:task_trust_development/features/cart/presentation/pages/cart_view.dart';
import 'package:task_trust_development/features/categories/presentation/pages/categories_view.dart';
import 'package:task_trust_development/features/profile/presentation/pages/profile_view.dart';

final List<Widget> navigationScreens = [
  CategoriesView(),
  CartView(),
  ProfileView(),
];
