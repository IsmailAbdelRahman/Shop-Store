import 'package:appstore/core/utils/component.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:appstore/feature/models/hendel_get_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var textController = TextEditingController();
  GlobalKey<FormState> globallKeyw = GlobalKey<FormState>();
  bool passwd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ShopCubit, StateLoginShop>(
        builder: (BuildContext context, state) {
          ShopCubit c1 = ShopCubit.get(context);

          return Column(
            children: [
              Form(
                key: globallKeyw,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: customTextFormField(
                      controll: textController,
                      text: "Search",
                      return1null: "Please enter words",
                      prefixIconRight: Icons.search,
                      fun: () {
                        if (globallKeyw.currentState!.validate()) {
                          c1.getfunWeather(nameCountry: textController.text);
                          //  print(c1.ModelGetWeather );
                          //print( "=========${ cubitsearch1.modelSearch!.data!.data0![1].name.toString()}");
                        }
                      }),
                ),
              ),
              Expanded(
                child: SizedBox(
                    height: 500,
                    child: state is SeccessfullgetWeather
                        ? ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (contxt, _) {
                              return cateF(s1: c1.modelGetWeather!.DataMap[_]);
                            },
                            separatorBuilder: (context, _) => const Divider(),
                            itemCount: c1.modelGetWeather!.DataMap.length)
                        : const Center(child: Text("Search"))),
              ),

              //    CateF(     cubitsearch1.modelSearch!.data!.data![1])
            ],
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }

  Widget cateF({LdataW? s1}) {
    return ListTile(
      leading: Text(s1!.lat.toString()),
      subtitle: Text(s1.region.toString()),
      title: Text(
        s1.name.toString(),
        overflow: TextOverflow.clip,
        maxLines: 3,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
