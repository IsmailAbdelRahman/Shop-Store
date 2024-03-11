import 'package:appstore/feature/search/data/model/model_search.dart';

abstract class StateSearch {}

class InitialStateSearch extends StateSearch {}

class SeccessfullSearch extends StateSearch {
  ModelSearch modelSearch;
  SeccessfullSearch(this.modelSearch);
}

class ErrorSearch extends StateSearch {}
