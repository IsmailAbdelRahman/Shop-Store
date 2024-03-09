import 'package:appstore/core/utils/themes/app_assets.dart';
import 'package:appstore/core/utils/shared_preferences.dart';
import 'package:appstore/feature/login_shoping.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextTheme textth = const TextTheme(
    bodyLarge: TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600));

Widget customCategre(
    {required String title,
    required String urlNetImage,
    required String data,
    context}) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(50))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 15,
      child: Row(
        //  mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 170,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(urlNetImage == 'null'
                        ? AppAssets.testImage0
                        : urlNetImage),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              width: 170,
              height: 150,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 8,
                      child: Text(
                        title ?? 'Null',
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )),
                  Expanded(flex: 1, child: Text(data))
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void navigatorTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigatorAndFinshed(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
/*Widget articlBuilder( list , {  bool IsSearch=false } ){

  return */ /*state is LoadingdataNewsState */ /* list.length <1 ?  IsSearch ?Container() :Center(child: Lottie.asset('assets/lottie/112463-loader.json'))  : ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context ,_)=>  InkWell(  onTap: (){ NavigatorTo(context, S_WebView( list[_]['url'] ));  }  ,child: CoustemCategre( context: context, title:list[_]['title']  ,urlNetImage:list[_]['urlToImage'].toString() ,data:list[_]['publishedAt'].toString()  )),
      itemCount:list.length  );

}*/

Widget customTextFormField(
    {String? text,
    TextEditingController? controll,
    required String return1null,
    @required IconData? prefixIconRight,
    IconData? prefixIconLeft,
    VoidCallback? fun,
    bool passwd = false,
    Widget? ico}) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: TextFormField(
      controller: controll,
      validator: (val) {
        if (val!.isEmpty) {
          return return1null;
        }
        return null;
      },
      obscureText: passwd,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(
            text!,
          ),
          prefixIconColor: Colors.black,

          //widget ico
          icon: ico,
          suffixIcon: prefixIconRight != null
              ? IconButton(icon: Icon(prefixIconRight), onPressed: fun)
              : null,
          prefixIcon: prefixIconLeft != null ? Icon(prefixIconLeft) : null,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal))),
    ),
  );
}

SnackBar snackBarCoustem({String title = '', String message = ' '}) {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: ContentType.failure,
    ),
  );
}

SnackBar snakBars() {
  return const SnackBar(
    content: Card(
      child: Text('ssss'),
    ),
  );
}

/*


  Widget S (){


  return  Row(
    children: [
           SizedBox(
        width: 20,
      ),
      Expanded(

        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// SnackBar Body
            Container(
              margin: EdgeInsets.symmetric(
                horizontal:3
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 3

              ),
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: isMobile ? 8 : 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            /// `title` parameter
                            Text(
                              message,
                              style: TextStyle(
                                fontSize: size.height * 0.016,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                            ),
                            InkWell(
                              onTap: () => ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar(),
                              child: SvgPicture.asset(
                                AssetsPath.failure,
                                height: size.height * 0.022,
                                package: 'awesome_snackbar_content',
                              ),
                            )
                          ],
                        ),
                        const Spacer(),

                        /// `message` body text parameter
                        Center(child: Text(
                          message,
                          style: TextStyle(
                            fontSize: size.height * 0.016,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// other SVGs in body
            Positioned(
              bottom: 0,
              left: isTablet ? size.width * 0.1 : 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  AssetsPath.bubbles,
                  height: size.height * 0.06,
                  width: size.width * 0.05,
                  color: hslDark.toColor(),
                  package: 'awesome_snackbar_content',
                ),
              ),
            ),
            Positioned(
              top: -size.height * 0.02,
              left: isTablet ? size.width * 0.125 : size.width * 0.02,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsPath.back,
                    height: size.height * 0.06,
                    color: hslDark.toColor(),
                    package: 'awesome_snackbar_content',
                  ),
                  Positioned(
                    top: size.height * 0.015,
                    child: SvgPicture.asset(
                      assetSVG(contentType),
                      height: size.height * 0.022,
                      package: 'awesome_snackbar_content',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      isDesktop || isTablet
          ? const Spacer()
          : SizedBox(
        width: size.width * 0.02,
      ),
    ],
  );

  }*/

Future<bool?> tost(String msg, Colorenum state) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: funColorenum(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum Colorenum { error, correct, worry }

Color? funColorenum(Colorenum state) {
  Color color1;
  switch (state) {
    case Colorenum.correct:
      color1 = Colors.green;
      break;
    case Colorenum.error:
      color1 = Colors.red;
      break;
    case Colorenum.worry:
      color1 = Colors.yellow;
  }

  return color1;
}

void funLogOut(context) {
  ShPreferences.removeData('token').then((value) {
    if (value) {
      // value  bool   true   or  false
      navigatorAndFinshed(context, LoginShopState());
    }
  });
}
