import 'package:appstore/core/utils/component.dart';
import 'package:appstore/feature/search/presentation/manger/cubit_search/cubit_search.dart';
import 'package:appstore/feature/search/presentation/manger/cubit_search/state_search.dart';
import 'package:appstore/feature/search/presentation/view/widget/listview_separated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitSearch, StateSearch>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitSearch cubitSe = CubitSearch.get(context);

        return Scaffold(
            body: Column(
          children: [
            Form(
              key: cubitSe.globallKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: customTextFormField(
                    controll: cubitSe.textController,
                    text: "Search",
                    return1null: "Please enter words",
                    prefixIconRight: Icons.search,
                    fun: () {
                      if (cubitSe.globallKey.currentState!.validate()) {
                        cubitSe.postSearch(
                            text: cubitSe.textController.text.toString());
                      }
                    }),
              ),
            ),
            Expanded(
              child: state is SeccessfullSearch
                  ? ListSparatSearch(state.modelSearch.data!)
                  : const Center(child: Text("Search")),
            ),

            //    CateF(     cubitsearch1.modelSearch!.data!.data![1])
          ],
        ));
      },
    );
  }
}
