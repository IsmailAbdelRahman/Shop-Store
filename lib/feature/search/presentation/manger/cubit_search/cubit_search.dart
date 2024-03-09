import 'package:appstore/core/utils/network/dio_helper.dart';
import 'package:appstore/core/utils/end_Points.dart';
import 'package:appstore/feature/models/model_search.dart';
import 'package:appstore/feature/search/presentation/manger/cubit_search/state_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitSearch extends Cubit<StateSearch> {
  CubitSearch() : super(initialStateSearch());

  static CubitSearch get(context) => BlocProvider.of(context);

  ModelSearch? modelSearch;
  void postSearch({String text = " "}) {
    DioHelper.PostData(url: Search, Data: {"text": text}, token: tokin1)
        .then((value) {
      //   print(value.data);

      modelSearch = ModelSearch.fromJson(value.data);
      emit(SeccessfullSearch());
    }).catchError((e) {
      //  print(e);
      emit(ErrorSearch());
    });
  }
}
