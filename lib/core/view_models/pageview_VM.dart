import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:studio_web_app/meta/views/root/pages/home.page.dart';
import 'package:studio_web_app/meta/views/root/pages/work.page.dart';

class PageViewVM extends ChangeNotifier {

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  PageController rootPageController = PageController();

  List<Widget> get screens => const [
    HomePage(),
    WorkPage(),
  ];

  void updateCurrentPageIndex(int page){
    _currentPageIndex = page;
    notifyListeners();
  }
  void animateToIndex(int pageIndex) {
    rootPageController.animateToPage(pageIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    _currentPageIndex = pageIndex;
    notifyListeners();
  }

}
