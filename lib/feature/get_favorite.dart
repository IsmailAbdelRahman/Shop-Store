import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/models/parthing_get_favorites.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavoritesView extends StatelessWidget {
  const GetFavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, StateLoginShop>(
      builder: (BuildContext context, state) {
        List<FavoritesModelData>? cubit1 =
            ShopCubit.get(context).favoritesModel!.data!.data2;

        return ConditionalBuilder(
          condition: state is! LoadingchangeFav || cubit1 != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (contxt, _) {
                  return cateF(
                      ShopCubit.get(context).favoritesModel!.data!.data2![_],
                      context);
                },
                separatorBuilder: (context, _) => const Divider(),
                itemCount: cubit1!.length),
          ),
          fallback: (context) => const CircularProgressIndicator(),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Widget cateF(FavoritesModelData s1, context) {
    return ListTile(
      leading: Image(
        image: NetworkImage(s1.product!.image.toString()),
        width: 100,
      ),
      title: Text(s1.product!.name.toString(), maxLines: 2),
      trailing: CircleAvatar(
          radius: 15,
          backgroundColor: ShopCubit.get(context).fav[s1.product!.id] ?? false
              ? Colors.blue
              : Colors.grey,
          child: IconButton(
            onPressed: () {
              ShopCubit.get(context).postChangeColorFavorite(s1.product!.id!);
            },
            icon: const Icon(
              Icons.favorite_outline,
            ),
            iconSize: 14,
            color: Colors.white,
          )),
    );
  }
}
