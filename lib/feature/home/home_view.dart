import 'package:appstore/core/utils/component.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/models/classSch.dart';
import 'package:appstore/feature/models/parthing_category.dart';
import 'package:appstore/feature/search/presentation/view/shearch_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, StateLoginShop>(listener: (context, state) {
      if (state is ChangeSeccesfulColorFavoriteState) {
        if (!state.stateF!) {
          ///لو بتساوى فولس
          tost("لم يتم تنفيذ طلبك", Colorenum.error);
        } else {
          /// غير كدا هتبقا ترو طيب اعرضلى ال مكتوب ف الماسج سواء اضافه او حذف
          tost(state.message.toString(), Colorenum.correct);
        }
      }

      ////////////////////
      /*if (state is  ChangeIndextBottomNBar){
            print( "indext : ${state.indextBottomNBar}");
          }*/
      ///////////////////////////////////
    }, builder: (context, state) {
      ShopCubit cubitSh = ShopCubit.get(context);
      /////////////////////////////// no
      //  cubitSearch cubitsearch1 = cubitSearch.get(context);
      /////////////////////

      //    Category_Model  Bal =     Category_Model.forjson(CubitSh.UserCategory(Tokin:Tokin1 ));
      //     print(Bal.data);

      //    print( CubitSh.ObHomeUser!.data!.Listbanners![0].image.toString());
      return Scaffold(
        appBar: AppBar(
          //   title: Text('sss : ${ CubitSh.ObHomeUser!.data!.Listbanners![0].image}'),
          title: const Text('Home '),
          actions: [
            IconButton(
                onPressed: () {
                  navigatorTo(context, const SearchView());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.amberAccent,
                )),

            IconButton(
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.blue,
                ),
                onPressed: () {
                  funLogOut(context);
                }),

            //print('object');
          ],
        ),

        ///1
        body: ConditionalBuilder(
          builder: (context) =>
              carouse(cubitSh.obHomeUser!, cubitSh.categ!, context),
          condition: cubitSh.obHomeUser != null,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),

        ///2
        //   body:  ConditionalBuilder(builder: (context)=>Carouse( CubitSh.ObHomeUser!.data!.Listbanners!)   ,condition:CubitSh.ObHomeUser != null  ,fallback: (context)=>Center(child: CircularProgressIndicator()), ) ,
        ///3
        // body:  ConditionalBuilder(builder: (context)=>Carouse(    CubitSh.ObHomeUser!.data!.Listbanners!.map((e) => Image(image: NetworkImage(e.image.toString()))).toList()   )   ,condition:CubitSh.ObHomeUser != null  ,fallback: (context)=>Center(child: CircularProgressIndicator()), ) ,
      );
    });
  }

  ///1
  Widget carouse(HomeUser s1, CategoryModel? categoryModel, context) {
    return Column(
      children: [
        //////////////////1
        SizedBox(
          height: 120,
          child: CarouselSlider(
              items: s1.data!.Listbanners!
                  .map((e) => Image(image: NetworkImage(e.image.toString())))
                  .toList(),
              options: CarouselOptions(
                  //height: 200.50 ,
                  initialPage: 0,
                  viewportFraction: 2,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  height: 170,
                  autoPlayAnimationDuration: const Duration(seconds: 15),
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayCurve: Curves.easeInOut,
                  scrollDirection: Axis.horizontal)),
        ),
        /////////////////////////2
        Expanded(
          flex: 1,
          child: ListView.separated(
            itemCount: categoryModel!.data!.data2!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, _) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                      image: NetworkImage(
                          categoryModel.data!.data2![_].Image.toString())),
                  Container(
                      alignment: Alignment.topCenter,
                      width: 150,
                      height: 20,
                      color: Colors.black.withAlpha(50),
                      child:
                          Text(categoryModel.data!.data2![_].name.toString())),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const VerticalDivider(color: Colors.amber),
          ),
        ),

        /*       Expanded(
          child: GridView.count(
              crossAxisCount:2,
          mainAxisSpacing: 21,
          crossAxisSpacing: 2,
          children: List.generate( s1.data!.Listbanners!.length, (index) =>    Image(image: NetworkImage(s1.data!.Listproducts![index].Image.toString()  ) , height: 100,width: 100,  fit: BoxFit.fitHeight,)  )      ),
        )*/
        ///////////////3
        Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10),
              color: Colors.grey.withAlpha(13),
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                shrinkWrap: true,
                childAspectRatio: 1 / 1.6,
                children: List.generate(
                    s1.data!.Listproducts!.length,
                    (index) =>
                        funImageIndext(s1.data!.Listproducts![index], context)),
              ),
            ))
      ],
    );
  }

  Widget funImageIndext(productMod imageForIndext, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: AlignmentDirectional.centerStart,
          children: [
            SizedBox(
                height: 180,
                width: 300,
                child: Image(
                  image: NetworkImage(imageForIndext.Image.toString()),
                  fit: BoxFit.fitHeight,
                )),
            Container(
                decoration: const BoxDecoration(
                  color: Colors.red,

                  // borderRadius: BorderRadius.only(topRight: Radius.circular(12) ,bottomRight: Radius.circular(12))
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  "Opstion ",
                )),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(0.8),
          color: Colors.white,
          height: 50,
          width: double.infinity,
          child: Text(imageForIndext.name.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textDirection: TextDirection.rtl),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Text(
                  imageForIndext.price.toString(),
                  style: const TextStyle(color: Colors.blue),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${imageForIndext.oldprice.round()}",
                  style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
                const Spacer(
                  flex: 5,
                ),
                CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        ShopCubit.get(context).fav[imageForIndext.id] ?? false
                            ? Colors.blue
                            : Colors.grey,
                    child: IconButton(
                      onPressed: () {
                        // ShopCubit.get(context).USerHome(Tokin: Tokin1);
                        //    print( " Output Colors =>>${ShopCubit.get(context).fav[ImageForIndext.id] }");
                        ShopCubit.get(context)
                            .postChangeColorFavorite(imageForIndext.id!);

                        // print(imageForIndext.id);
                        //print(ShopCubit.get(context).fav[imageForIndext.id]);

                        //    print(Tokin1);
                        //  print(ImageForIndext.id);
                        //   print(ShopCubit.get(context).fav  );

                        //  print(  ShopCubit.get(context).PostChange_ColorFavorite(ImageForIndext.id!));
                        // print( " =? status ${  ShopCubit.get(context).change_favoritesModels!.Status}");
                        //   print(ShopCubit.get(context).fav[ImageForIndext.id]);
                        //   print(ShopCubit.get(context).fav);
                      },
                      icon: const Icon(
                        Icons.favorite_outline,
                      ),
                      iconSize: 14,
                      color: Colors.white,
                    )),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
        /* Divider(color: Colors.black,)*/
      ],
    );
  }

////////////////////////////////////////////////////////////////////////
  ///2
/*  Widget Carouse(    List<bannerMod>  s1   ){


  return  CarouselSlider(items: s1.map((e) => Image(image: NetworkImage(e.image.toString()))).toList(), options: CarouselOptions());

 //   return  CarouselSlider(items: s1.data!.Listbanners!.map((e) => Image(image: NetworkImage(e.image.toString()))).toList() , options: CarouselOptions());



  }*/
////////////////////////////////////////////////////////////////////////
  ///3
/*  Widget Carouse(   List<Widget> s1   ){


    return  CarouselSlider(items: s1, options: CarouselOptions(


    ));

    //   return  CarouselSlider(items: s1.data!.Listbanners!.map((e) => Image(image: NetworkImage(e.image.toString()))).toList() , options: CarouselOptions());

  }*/
/////
////////////////////////////////////////////////////////////////////////
  ///fu

/* Widget GridViewImage ( List<productMod> s1){

  return Container(
    width:double.maxFinite, height: 400,

    child: GridView.count(crossAxisCount:2,
     // physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisSpacing: 1,
    mainAxisSpacing: 5,
    semanticChildCount: 12,
    padding: EdgeInsets.all(5),
    childAspectRatio: 1 /1.0,
    scrollDirection: Axis.vertical,
      children:  s1.map((e) =>  Image(image: NetworkImage(e.Image.toString()  ) ,  fit: BoxFit.fitHeight,)  ).toList(),
    ),
  );

}*/
////////////////////////////////////////////////////////////////////////
/*
  Widget GridViewImage (    s1  ){

    return Container(
      width:double.maxFinite, height: 400,

      child: GridView.count(crossAxisCount:2,
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 1,
        mainAxisSpacing: 5,
        semanticChildCount: 12,
        padding: const EdgeInsets.all(5),
        childAspectRatio: 1 /1.0,
        scrollDirection: Axis.vertical,
        children:  s1.map((e) =>  Image(image: NetworkImage(e.Image.toString()  ) ,  fit: BoxFit.fitHeight,)  ).toList(),
      ),
    );

  }*/

/////////
}
