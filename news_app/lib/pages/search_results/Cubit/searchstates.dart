import 'package:news_app/core/networking/models.dart';

abstract class Searchstates {}

class InitialState extends Searchstates {}

class Loadingstate extends Searchstates {}

class Successstate extends Searchstates {
  final Models model;
  Successstate(this.model);
}

class Errorstate extends Searchstates {
  final String error;
  Errorstate(this.error);
}
