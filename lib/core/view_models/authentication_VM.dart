import 'package:flutter/material.dart';


class AuthenticationScreenVM extends ChangeNotifier{

  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _specialityController = TextEditingController();

  TextEditingController get infoController => _infoController;
  TextEditingController get specialityController => _specialityController;


}