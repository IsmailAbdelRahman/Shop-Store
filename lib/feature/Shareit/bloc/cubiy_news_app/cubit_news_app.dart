import 'package:appstore/core/utils/network/dio_helper.dart';
import 'package:appstore/feature/Shareit/bloc/cubiy_news_app/state_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitNewsApp extends Cubit<SuperNewsAppState> {
  CubitNewsApp() : super(InitialStateNewsApp());

  static CubitNewsApp get(context) => BlocProvider.of(context);
////////////////////

//////////////////////////////

  int index = 0;
  void changeIndex(int index) {
    if (index == 1) {
      getDataNews();
    } else if (index == 2) {
      getDataBusiness();
    }
    this.index = index;
    emit(ChangeStateIndexBottomNavigation());
  }

  List<dynamic> listDataNews = [];
  void getDataNews() {
    emit(LoadingDataNewsState());
    if (listDataNews.isEmpty) {
      DioHelper.get(url: 'v2/top-headlines', queryParameter: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': 'dc7a0a614fd147d4af9e89f5d3bc4553'
      }).then((value) {
        listDataNews = value.data['articles'];
        emit(GetDataNewsState());
      }).catchError((er) {
        //  print('er: $er');
        emit(ErrorDataNewsState(er));
      });
    } else {
      emit(SuccessGatDataher());
    }
  }

  List<dynamic> listDataBusiness = [];
  void getDataBusiness() {
    emit(LoadingDataBusinessState());
    if (listDataBusiness.isEmpty) {
      DioHelper.get(url: 'v2/top-headlines', queryParameter: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'dc7a0a614fd147d4af9e89f5d3bc4553'
      }).then((value) {
        listDataBusiness = value.data['articles'];
        emit(GetDataBusinessState());
      }).catchError((er) {
        emit(ErrorDataBusinessState());
      });
    } else {
      emit(SuccessGatDataher());
    }
  }

  List<dynamic> listDataSports = [];
  void getDataSports() {
    emit(LoadingDataSportsState());
    if (listDataSports.isEmpty) {
      //////////////////
      DioHelper.get(url: 'v2/top-headlines', queryParameter: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'dc7a0a614fd147d4af9e89f5d3bc4553'
      }).then((value) {
        // print(value.data);
        listDataSports = value.data['articles'];
        emit(GetDataSportsState());
      }).catchError((er) {
        emit(ErrorDataSportsState());
      });
    } else {
      emit(SuccessGatDataher());
    }
  }

////////////////////// search
//https://newsapi.org/v2/everything?q=apple&apiKey=dc7a0a614fd147d4af9e89f5d3bc4553

  List<dynamic> listDataSearch = [];
  void getDataSearch(String value) {
    emit(LoadingDataSearchState());
    //////////////////
    DioHelper.get(url: 'v2/everything', queryParameter: {
      'q': value,
      'apiKey': 'dc7a0a614fd147d4af9e89f5d3bc4553'
    }).then((value) {
      // print(value.data);
      listDataSearch = value.data['articles'];
      emit(GetDataSearchState());
    }).catchError((er) {
      emit(ErrorDataSearchState());
    });
  }
}
