import 'package:appstore/core/utils/component.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/auth/data/model/model_login.dart';
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
          tost("لم يتم تنفيذ طلبك", Colorenum.error);
        } else {
          tost(state.message.toString(), Colorenum.correct);
        }
      }

      ////////////////////

      ///////////////////////////////////
    }, builder: (context, state) {
      ShopCubit cubitSh = ShopCubit.get(context);
      /////////////////////////////// no

      return Scaffold(
        appBar: AppBar(
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
                  //  Navigator.pop(context);
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
              items: s1.data!.listbanners!
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
                          categoryModel.data!.data2![_].image.toString())),
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
                    s1.data!.listproducts!.length,
                    (index) =>
                        funImageIndext(s1.data!.listproducts![index], context)),
              ),
            ))
      ],
    );
  }

  Widget funImageIndext(ProductMod imageForIndext, context) {
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
                  image: NetworkImage(imageForIndext.image.toString()),
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
                        ShopCubit.get(context)
                            .postChangeColorFavorite(imageForIndext.id!);
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
}
