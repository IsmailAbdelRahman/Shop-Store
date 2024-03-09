import 'package:appstore/core/utils/network/dio_helper.dart';
import 'package:appstore/core/utils/end_Points.dart';
import 'package:appstore/feature/models/model_search.dart';
import 'package:appstore/feature/search/presentation/manger/cubit_search/state_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitSearch extends Cubit<StateSearch> {
  CubitSearch() : super(InitialStateSearch());

  static CubitSearch get(context) => BlocProvider.of(context);

  TextEditingController textController = TextEditingController();
  GlobalKey<FormState> globallKey = GlobalKey<FormState>();

  // ModelSearch? modelSearch;
  void postSearch({String text = " "}) {
    DioHelper.postData(
            url: AppConstans.search,
            data: {"text": text},
            token: AppConstans.tokin1)
        .then((value) {
      //   print(value.data);

      // modelSearch = ModelSearch.fromJson(value.data);
      emit(SeccessfullSearch(ModelSearch.fromJson(value.data)));
    }).catchError((e) {
      //  print(e);
      emit(ErrorSearch());
    });
  }
}
