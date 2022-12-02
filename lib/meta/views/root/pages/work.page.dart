import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studio_web_app/meta/utils/app_theme.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> with AutomaticKeepAliveClientMixin<WorkPage>{


  Widget _buildJobWidget({bool firstValue = false, required String firstText,}){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all(AppTheme.whiteColor),
          checkColor: AppTheme.whiteColor,
          value: false,
          onChanged: null,
        ),
        Text(
          firstText,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
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
                Text("We need", style: Theme.of(context).textTheme.bodyText1?.copyWith(letterSpacing: 1.5),),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 100,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildJobWidget(firstText: 'Graphic Designer',),
                        _buildJobWidget(firstText: 'Work Crew',),
                        _buildJobWidget(firstText: 'Application Developer',),
                        _buildJobWidget(firstText: 'Web Developer', ),
                        _buildJobWidget(firstText: 'Videographer', ),
                        _buildJobWidget(firstText: 'Video Editor', ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildJobWidget(firstText:  '3D Designer',),
                        _buildJobWidget(firstText: 'VFX Artist',),
                        _buildJobWidget(firstText: 'Sound Engineer',),
                        _buildJobWidget(firstText: 'Producers',),
                        _buildJobWidget(firstText: "Photographer"),
                        _buildJobWidget(firstText: 'Investors', ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text("Any experience level", style: Theme.of(context).textTheme.bodyText1?.copyWith(letterSpacing: 1.5),),
                const SizedBox(height: 50),
                Text("Once our vacancies are full we will tick the boxes above", style: Theme.of(context).textTheme.bodyText1?.copyWith(letterSpacing: 1.5),),
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
