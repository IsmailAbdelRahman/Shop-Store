import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/card.dart';
import 'package:appstore/feature/category_view.dart';
import 'package:appstore/feature/get_favorite.dart';
import 'package:appstore/feature/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Widget> bottomNBar = [
  const CategoryView(),
  const GetFavoritesView(),
  const HomeView(),
  const CardesView()
];

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});
  @override
  //BlocProvider(create: (context) => ShopCubit()),
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, StateLoginShop>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit cubitSh = ShopCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              elevation: 10,
              currentIndex: cubitSh.indextBottomNBar,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
              ],
              onTap: (index) {
                cubitSh.funChangeIndextBottomNBar(index);
              },
            ),
            body: bottomNBar[cubitSh.indextBottomNBar],
          );
        });
  }
}
