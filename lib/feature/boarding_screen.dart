import 'package:appstore/core/utils/component.dart';
import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/feature/login_shoping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewHorizontal {
  String? Image;
  String? Text1;
  String? Text2;

  PageViewHorizontal({required this.Image, this.Text1, this.Text2});
}

List<PageViewHorizontal> PVHList = [
  // an on y mous
  PageViewHorizontal(
      Image: 'assets/images/s0.png', Text1: 'FreeFire', Text2: 'Top One boy'),
  PageViewHorizontal(
      Image: 'assets/images/s1.png', Text1: 'Data', Text2: 'Hello World'),
  PageViewHorizontal(
      Image: 'assets/images/s2.png', Text1: 'Quora', Text2: 'Tail'),
];

class OnBoarding extends StatelessWidget {
  var PageControllerry = PageController();

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
              )
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //بظبط اعدادات الكنترول بيج
            PageControllerry.nextPage(
                duration: const Duration(milliseconds: 720),
                curve: Curves.fastLinearToSlowEaseIn);
            // if(PageControllerry.page==2){Navigator.push(context, MaterialPageRoute(builder:(context)=>S_setting()));}

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
                controller: PageControllerry,
                itemCount: PVHList.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (context) {
                  ///0,1,2      size =3 -1=2    كاني قلت لمه 2=2
                  if (context == PVHList.length - 1) {
                    // NavigationTo(context, S_setting());

                    lastPage = true;
                  } else {
                    lastPage = false;
                  }

                  //   print('${context} ,= ${PVHList.length - 1}');
                },
                itemBuilder: (context, _) {
                  return pageV(PVHList[_]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: SmoothPageIndicator(
                  textDirection: TextDirection.ltr,
                  controller: PageControllerry,
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

  Widget pageV(PageViewHorizontal s1) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(s1.Image.toString())),
          Text('${s1.Text1}', style: const TextStyle(fontSize: 30)),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            Text(s1.Text2.toString()),
            const Text(
              'Tm',
              style: TextStyle(fontSize: 10),
            )
          ]),
        ],
      ),
    );
  }
}
