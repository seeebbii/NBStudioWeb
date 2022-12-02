import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_sizes.dart';
import 'app_theme.dart';

class AppFunctions {
  static Color getHexColor(String hashColor) {
    String withoutHash = hashColor.substring(1);
    String hexColor = '0xff$withoutHash';
    int? finalHexColor = int.parse(hexColor);
    return Color(finalHexColor);
  }

  void customSnackBar(BuildContext context, String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(
          msg,
          style: const TextStyle(fontSize: 18.0, color: AppTheme.black),
        )));
  }


  // Future<dynamic> setBottomSheet(BuildContext context, VoidCallback msgBtnPress, VoidCallback phoneBtnPress, VoidCallback seeDetailPress, VoidCallback startTourPress) {
  //   return showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           decoration: BoxDecoration(
  //             color: AppTheme.appBGColor,
  //             borderRadius: BorderRadius.only(
  //                 topRight: Radius.circular(
  //                   AppSizes.height15,
  //                 ),
  //                 topLeft: Radius.circular(
  //                   AppSizes.height15,
  //                 )),
  //             boxShadow: const [
  //               BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
  //             ],
  //           ),
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: AppSizes.width10, vertical: AppSizes.height10),
  //             child: Wrap(
  //               children: [
  //                 Column(
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: Row(
  //                             children: [
  //                               Text(
  //                                 '10 min',
  //                                 textAlign: TextAlign.start,
  //                                 style: TextStyle(
  //                                   fontSize: AppSizes.height16,
  //                                   color: AppTheme.appColor,
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 width: AppSizes.width4,
  //                               ),
  //                               Text(
  //                                 '(2.2)',
  //                                 textAlign: TextAlign.start,
  //                                 style: TextStyle(
  //                                   fontSize: AppSizes.height16,
  //                                   color: Colors.white,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         Expanded(
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.end,
  //                             children: [
  //                               GestureDetector(
  //                                 onTap: msgBtnPress,
  //                                 child: SizedBox(
  //                                   height: AppSizes.height35,
  //                                   width: AppSizes.width35,
  //                                   child: SvgPicture.asset(Assets.roundMessageIcon),
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 width: AppSizes.width10,
  //                               ),
  //                               GestureDetector(
  //                                 onTap: phoneBtnPress,
  //                                 child: SizedBox(
  //                                   height: AppSizes.height35,
  //                                   width: AppSizes.width35,
  //                                   child: SvgPicture.asset(Assets.roundPhoneIcon),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: AppSizes.height5,),
  //                     CustomAppText(
  //                       text: 'Buyer information',
  //                       fontSize: AppSizes.height20,
  //                       color: Colors.white,
  //                       textAlign: TextAlign.start,
  //                     ),
  //                     SizedBox(height: AppSizes.height15,),
  //                     Row(
  //                       children: [
  //                         SizedBox(
  //                           height: AppSizes.height20,
  //                           width: AppSizes.width20,
  //                           child: SvgPicture.asset(Assets.personWhiteIcon),
  //                         ),
  //                         SizedBox(
  //                           width: AppSizes.width4,
  //                         ),
  //                         Expanded(
  //                           child: CustomAppText(
  //                             text: 'Ahmad al hussaini',
  //                             fontSize: AppSizes.height16,
  //                             color: Colors.white,
  //                             textAlign: TextAlign.start,
  //                           ),
  //                         ),
  //                         Container(
  //                           padding: EdgeInsets.symmetric(vertical: AppSizes.height2, horizontal: AppSizes.width4),
  //                           decoration: BoxDecoration(
  //                               color: AppTheme.orderPriceBG.withAlpha(90),
  //                               borderRadius: BorderRadius.all(Radius.circular(AppSizes.height3)),
  //                               border: Border.all(color: AppTheme.orderPriceBorder,)
  //                           ),
  //                           child: Text('\$ 12', style: TextStyle(color: Colors.white, fontSize: AppSizes.height14, fontWeight: FontWeight.bold),),
  //                         )
  //                       ],
  //                     ),
  //                     SizedBox(height: AppSizes.height15,),
  //                     Row(
  //                       children: [
  //                         SizedBox(
  //                           height: AppSizes.height20,
  //                           width: AppSizes.width20,
  //                           child: SvgPicture.asset(Assets.addressWhiteIcon),
  //                         ),
  //                         SizedBox(
  //                           width: AppSizes.width4,
  //                         ),
  //                         Expanded(
  //                           child: CustomAppText(
  //                             text: 'Deliver to - 8837 West Old York Drive Chattan.....',
  //                             fontSize: AppSizes.height16,
  //                             color: Colors.white,
  //                             textAlign: TextAlign.start,
  //                           ),
  //                         ),
  //                         Text('(2km)', style: TextStyle(color: Colors.red, fontSize: AppSizes.height14, fontWeight: FontWeight.bold),),
  //                       ],
  //                     ),
  //                     SizedBox(height: AppSizes.height15,),
  //                     CustomMaterialButton(
  //                       title: 'See details',
  //                       bgColor: Colors.white,
  //                       textColor: Colors.black,
  //                       btnSize: AppSizes.height14,
  //                       textSize: AppSizes.height15,
  //                       onTap: () {
  //                         seeDetailPress;
  //                       },
  //                     ),
  //                     SizedBox(
  //                       height: AppSizes.height15,
  //                     ),
  //                     CustomMaterialButton(
  //                       title: 'Start tour',
  //                       bgColor: AppTheme.appColor,
  //                       textColor: Colors.black,
  //                       btnSize: AppSizes.height14,
  //                       textSize: AppSizes.height15,
  //                       onTap: () {
  //                         startTourPress;
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

}
