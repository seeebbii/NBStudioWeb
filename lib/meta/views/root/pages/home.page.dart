import 'dart:developer';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'dart:html';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio_web_app/components/widgets/app_elevated_button.dart';
import 'package:studio_web_app/components/widgets/app_simple_text_field.dart';
import 'package:studio_web_app/core/notifiers/form.notifier.dart';
import 'package:studio_web_app/core/view_models/authentication_VM.dart';
import 'package:studio_web_app/meta/utils/app_theme.dart';
import 'package:studio_web_app/meta/utils/base_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  String currentFileSelected = '';
  String fileExtension = '';
  Uint8List? selectedFileBytes;

  void _trySubmit() async {
    FormNotifier formNotifier = context.read<FormNotifier>();
    AuthenticationScreenVM authenticationScreenVM = context.read<AuthenticationScreenVM>();

    if (currentFileSelected == '' && selectedFileBytes == null) {
      BaseHelper.showSnackBar("CV is missing");
      return;
    }

    EasyLoading.show();

    // Upload Submission
    await formNotifier.submitForm(
        speciality: authenticationScreenVM.specialityController.text.trim(),
        info: authenticationScreenVM.infoController.text.trim(),
        file: selectedFileBytes!,
    fileName: "${BaseHelper.formatDateWithMonth(DateTime.now())}-${BaseHelper.formatTime(DateTime.now())}.$fileExtension");

    fileExtension = '';
    currentFileSelected = '';
    selectedFileBytes = null;
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authenticationScreenVM =
        context.watch<AuthenticationScreenVM>();
    super.build(context);
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: Center(
        // color: Colors.red,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Why you?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(letterSpacing: 1.5),
                ),
                const SizedBox(height: 30),
                AppSimpleTextField(
                  controller: authenticationScreenVM.specialityController,
                  hintText: "Your Speciality",
                  keyboard: TextInputType.text,
                  isOptional: true,
                  maxLines: 1,
                  onChange: (str) {},
                ),
                const SizedBox(height: 10),
                AppSimpleTextField(
                  controller: authenticationScreenVM.infoController,
                  hintText: "Tell us more about yourself",
                  keyboard: TextInputType.text,
                  maxLines: 10,
                  minLength: 5,
                  maxLength: 250,
                  isOptional: true,
                  onChange: (str) {},
                ),
                const SizedBox(height: 10),
                AppElevatedButton(
                  width: 350,
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.custom,
                      withReadStream: true,
                      withData: true,
                      allowedExtensions: ['pdf', 'doc', 'docx'],
                    );
                    if (result != null) {
                      // File file = File(result.paths.first)
                      result.files.first.readStream?.listen((event) {
                        setState(() {
                          selectedFileBytes = Uint8List.fromList(event);
                          currentFileSelected = result.files.first.name;
                          fileExtension = result.files.first.extension ?? ".pdf";
                        });
                      });
                    }
                  },
                  buttonText: 'Your CV Here',
                  textColor: AppTheme.whiteColor,
                  buttonColor: AppTheme.fieldFillColor,
                ),
                const SizedBox(height: 10),
                Text(
                  currentFileSelected,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(letterSpacing: 1.5),
                ),
                const SizedBox(height: 10),
                AppElevatedButton(
                  width: 350,
                  onPressed: _trySubmit,
                  buttonText: 'Submit',
                  textColor: AppTheme.whiteColor,
                  buttonColor: AppTheme.fieldFillColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
