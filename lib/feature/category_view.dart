import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/models/parthing_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, StateLoginShop>(
      builder: (BuildContext context, state) {
        List<CategoryModelData>? cubit1 =
            ShopCubit.get(context).categ!.data!.data2;

        return /*  CateF2(cubit1);*/

            ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (contxt, _) {
                  return cateF(ShopCubit.get(context).categ!.data!.data2![_]
                      /* s1*/
                      );
                },
                separatorBuilder: (context, _) => const Divider(),
                itemCount: cubit1!.length);
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Widget cateF(CategoryModelData s1) {
    return ListTile(
      leading: Image(
        image: NetworkImage(s1.image.toString()),
        width: 100,
      ),
      title: Text(s1.name.toString()),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
/*

  Widget CateF2(   List < Category_MData>? cubit1  ){

    return   ListView.separated(
        itemBuilder: ( contxt ,_) =>ListTile(leading: Image(image:  NetworkImage(cubit1![_].Image.toString() )
        ), title: Text(cubit1[_].name.toString()), trailing:  IconButton(onPressed:  () {} , icon: Icon(Icons.keyboard_arrow_right),),), separatorBuilder: (context ,_)=>Divider (), itemCount: cubit1!.length


    );

  }
*/
}
