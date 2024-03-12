import 'package:appstore/core/utils/component.dart';
import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/feature/boarding/data/model/model_pageview.dart';
import 'package:appstore/feature/boarding/presentation/view/widget/custome_item.dart';
import 'package:appstore/feature/auth/persentation/view/login_shoping.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<PageViewHorizontal> pVHList = [
  // an on y mous
  PageViewHorizontal(
      image1e: 'assets/images/s0.png',
      text1e: 'FreeFire',
      text2e: 'Top One boy'),
  PageViewHorizontal(
      image1e: 'assets/images/s1.png', text1e: 'Data', text2e: 'Hello World'),
  PageViewHorizontal(
      image1e: 'assets/images/s2.png', text1e: 'Quora', text2e: 'Tail'),
];

class OnBoarding extends StatelessWidget {
  var pageControllerry = PageController();

  bool lastPage = false;

  OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //   systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
          actions: [
            TextButton(
              onPressed: () => chickBord(context),
              child: const Text('Skip'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageControllerry.nextPage(
                duration: const Duration(milliseconds: 720),
                curve: Curves.fastLinearToSlowEaseIn);

            if (lastPage) {
              chickBord(context);
            }
          },
          child: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: PageView.builder(
              controller: pageControllerry,
              itemCount: pVHList.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (context) {
                if (context == pVHList.length - 1) {
                  lastPage = true;
                } else {
                  lastPage = false;
                }
              },
              itemBuilder: (context, inext) {
                return CustomItem(pVHList[inext]);
              },
            )),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: SmoothPageIndicator(
                  textDirection: TextDirection.ltr,
                  controller: pageControllerry,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor:
                        Color.alphaBlend(Colors.redAccent, Colors.teal),
                    spacing: 5,
                    dotColor: Colors.orange,
                  )),
            ),
          ],
        ));
  }

  void chickBord(context) {
    ShPreferences.savesetDataLoginSharedprefernec('isBoarding', true)
        .then((value) => {
              if (value) {navigatorAndFinshed(context, LoginShopState())}
            });
  }
}
