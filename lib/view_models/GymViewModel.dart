

import 'package:gym_practical/models/GymModel.dart';
import 'package:gym_practical/models/PopularClasses.dart';

class GymViewModel{
  GymModel _gymModel;

  GymViewModel(this._gymModel);

  int? get id => this._gymModel.id;

  String? get title =>  this._gymModel.title;

  double? get rating => this._gymModel.rating;

  String? get price =>  this._gymModel.price;

  bool? get favorite =>  this._gymModel.favorite;

  String? get date =>  this._gymModel.date;

  set setFavorite(bool value) {
    this._gymModel.favorite = value;
  }

  List<PopularClasses>? get popularClasses =>  this._gymModel.popular_clasess;


}

class PopularViewModel{
  PopularClasses _popularModel;

  PopularViewModel(this._popularModel);

  String? get title =>  this._popularModel.title;

  String? get price =>  this._popularModel.price;

  bool? get favorite =>  this._popularModel.favorite;

  String? get date =>  this._popularModel.location;

}