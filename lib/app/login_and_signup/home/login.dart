// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lulu_stylist_app/lulu_design_system/core/lulu_brand_color.dart';
// import 'package:lulu_stylist_app/lulu_design_system/widgets/sa_button.dart';
// import 'package:lulu_stylist_app/routes/routes.dart';

// class ExpertLogin extends StatefulWidget {
//   const ExpertLogin({super.key});

//   @override
//   State<ExpertLogin> createState() => _ExpertLoginState();
// }

// class _ExpertLoginState extends State<ExpertLogin> {
//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context);
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//               top: -504.h,
//               left: -249.w,
//               height: 856.h,
//               width: 856.w,
//               child: Image.asset(
//                 'assets/images/colored_circles.png',
//               ),
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 493.h,
//                   ),
//                   SizedBox(
//                     width: 267.w,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         LuluButton.primary(
//                           label: localizations.loginAsUser,
//                           onPressed: () {
//                             GoRouter.of(context).pushReplacementNamed(
//                               route.expertNumber,
//                               pathParameters: {
//                                 'isUser': 'true',
//                                 'isExpert': 'false',
//                               },
//                             );
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Center(
//                           child: GestureDetector(
//                             onTap: () {
//                               GoRouter.of(context).pushReplacementNamed(
//                                 router.userNumber,
//                                 pathParameters: {
//                                   'isUser': 'false',
//                                   'isExpert': 'true',
//                                 },
//                               );
//                             },
//                             child: Text(
//                               localizations.signUpAsUser,
//                               style: TextStyle(
//                                 color: LuluBrandColor.brandPrimary,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
