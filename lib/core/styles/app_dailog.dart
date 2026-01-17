// import 'package:flutter/material.dart';
//
// import 'colors.dart';
//
//
// class AppDialog {
//
//   static void showLoading({
//     required BuildContext context,
//   }) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return Center(
//           child: Image.asset(
//             AnimationGif.loading,
//             height: 80.h,
//             width: 80.w,
//           ),
//         );
//       },
//     );
//   }
//
//   static void hideLoading(BuildContext context) {
//     if (Navigator.canPop(context)) {
//       Navigator.pop(context);
//     }
//   }
//
//   static void showMessage(
//       {required BuildContext context, required String message}) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Theme.of(context).primaryColor,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Text(
//                 'ok',
//                 style: AppTextStyles.textStyle24.copyWith(
//                   color: Theme.of(context).canvasColor,
//                 ),
//               ),
//             )
//           ],
//           title: Icon(
//             Icons.warning_amber,
//             color: MyColors.red,
//             size: 30.sp,
//           ),
//           content: Text(
//             message,
//             maxLines: 5,
//             overflow: TextOverflow.ellipsis,
//             style: AppTextStyles.textStyle18.copyWith(
//               color: Theme.of(context).canvasColor,
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//   static void showSnackBar(BuildContext context, String message) {
//     final snackBar = SnackBar(
//       content: Text(
//         message,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 18.sp,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       backgroundColor: Colors.teal,
//       behavior: SnackBarBehavior.floating,
//       width: 300.w,
//       duration: const Duration(seconds: 3),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
// }