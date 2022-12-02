import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:studio_web_app/app/constants/assets.constant.dart';
import 'package:studio_web_app/components/widgets/app_appbar.dart';
import 'package:studio_web_app/core/view_models/pageview_VM.dart';
import 'package:studio_web_app/meta/utils/app_theme.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen>
    with AutomaticKeepAliveClientMixin<RootScreen> {
  @override
  Widget build(BuildContext context) {
    PageViewVM pageViewVM = context.watch<PageViewVM>();
    super.build(context);
    return Scaffold(
        backgroundColor: AppTheme.blackColor,
        appBar: AppAppbar(
          toolbarHeight: 80,
          elevation: 0,
          bgColor: AppTheme.blackColor,
          leading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.005.sw),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.studioLogo,
                      height: 60,
                      width: 60,
                    ),
                    InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      onTap: () => pageViewVM.animateToIndex(0),
                        child: Text(
                      "HOME",
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                          fontWeight: FontWeight.w100, letterSpacing: 1),
                    )),
                    SizedBox(
                      width: 0.015.sw,
                    ),
                    InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => pageViewVM.animateToIndex(1),
                        child: Text(
                          "WORK",
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontWeight: FontWeight.w100, letterSpacing: 1),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageViewVM.rootPageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: pageViewVM.updateCurrentPageIndex,
          children: pageViewVM.screens,
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
