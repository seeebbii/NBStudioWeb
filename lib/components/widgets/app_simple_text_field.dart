import 'package:studio_web_app/core/view_models/authentication_VM.dart';
import 'package:studio_web_app/meta/utils/app_sizes.dart';
import 'package:studio_web_app/meta/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppSimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  // final String fieldNameText;
  final bool isEmail;
  final bool isName;
  final bool isPhone;
  final bool isPass;
  final bool isRePass;
  final bool isReadOnly;
  final bool isOptional;
  final int minLength;
  final int maxLength;
  final int maxLines;
  final TextInputType keyboard;
  final String validationMsg;
  final TextInputAction textInputAction;
  final bool isSuffixIcoCustom;
  Function onChange;
  Widget? suffixIcon;

  AppSimpleTextField(
      {Key? key,
      required this.controller,
      this.hintText = '',
      // required this.fieldNameText,
      this.isEmail = false,
      this.isName = false,
      this.isPhone = false,
      this.isPass = false,
      this.isRePass = false,
      this.isReadOnly = false,
      this.isOptional = true,
      this.isSuffixIcoCustom = false,
      this.minLength = 1,
      this.maxLength = 1,
      this.maxLines = 1,
      required this.keyboard,
      this.validationMsg = 'field_required_tr',
      this.textInputAction = TextInputAction.done,
      this.suffixIcon,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authenticationScreenVM = context.watch<AuthenticationScreenVM>();
    bool isEmailValid(String value) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      return emailValid;
    }

    return SizedBox(
      // height: 60,
      width: 350,
      child: TextFormField(
          minLines: minLength,
          maxLines: maxLines,
          readOnly: isReadOnly,
          validator: isOptional != true
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return (validationMsg);
                  }
                  return null;
                }
              : (value) {
                  return null;
                },
          onChanged: (str)=> onChange(str),
          textInputAction: textInputAction,
          keyboardType: keyboard,
          controller: controller,
          obscureText:  false,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3?.copyWith(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(right: 10, left: 10, bottom: 25, top: 10),
            fillColor: AppTheme.fieldFillColor,
            filled: true,
            border: InputBorder.none,
            isDense: true,
            labelText: hintText,
            // hintStyle: Theme.of(context).textTheme.headline3?.copyWith(color: AppTheme.subtitleLightGreyColor),
            labelStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w100, letterSpacing: 1.5),
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelStyle: Theme.of(context)
                .textTheme
                .bodyText1?.copyWith(fontSize: 8, color: Colors.transparent),
            // labelText: fieldNameText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          )),
    );
  }
}
