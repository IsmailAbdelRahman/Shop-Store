import 'package:appstore/core/utils/component.dart';
import 'package:appstore/feature/models/model_search.dart';
import 'package:appstore/feature/search/presentation/manger/cubit_search/cubit_search.dart';
import 'package:appstore/feature/search/presentation/manger/cubit_search/state_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  GlobalKey<FormState> globallKey = GlobalKey<FormState>();

  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    //BlocProvider(create: (context)=> cubitSearch()),
    return BlocConsumer<CubitSearch, StateSearch>(
      listener: (context, state) {},
      builder: (context, state) {
        //cubitSearch cubitsearch = BlocProvider.of(context);  // no
        CubitSearch cubitsearch1 = CubitSearch.get(context);

        return Scaffold(
            body: Column(
          children: [
            Form(
              key: globallKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: customTextFormField(
                    controll: textController,
                    text: "Search",
                    return1null: "Please enter words",
                    prefixIconRight: Icons.search,
                    fun: () {
                      if (globallKey.currentState!.validate()) {
                        cubitsearch1.postSearch(
                            text: textController.text.toString());
                        //print( "=========${ cubitsearch1.modelSearch!.data!.data0![1].name.toString()}");
                      }
                    }),
              ),
            ),
            Expanded(
              child: SizedBox(
                  height: 500,
                  child: state is SeccessfullSearch
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (contxt, _) {
                            return cateF(
                                cubitsearch1.modelSearch!.data!.data0![_]);
                          },
                          separatorBuilder: (context, _) => const Divider(),
                          itemCount:
                              cubitsearch1.modelSearch!.data!.data0!.length)
                      : const Center(child: Text("Search"))),
            ),

            //    CateF(     cubitsearch1.modelSearch!.data!.data![1])
          ],
        ));
      },
    );
  }

  Widget cateF(Data1 s1) {
    return ListTile(
      leading: Image(
        image: NetworkImage(s1.image.toString()),
        width: 50,
      ),
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
