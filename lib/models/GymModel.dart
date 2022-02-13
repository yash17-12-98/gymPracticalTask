import 'package:gym_practical/models/PopularClasses.dart';

class GymModel {
  int? id;
  String? title;
  double? rating;
  String? price;
  bool? favorite;
  String? date;
  List<PopularClasses>? popular_clasess;


  GymModel(
      {this.id,
        this.title,
        this.rating,
        this.price,
        this.favorite,
        this.date,
        this.popular_clasess,});

  GymModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rating = json['rating'];
    price = json['price'];
    favorite = json['favorite'];
    date = json['date'];
    if (json['popular_clasess'] != null) {
      popular_clasess = <PopularClasses>[];
      json['popular_clasess'].forEach((v) {
        popular_clasess!.add(new PopularClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rating'] = this.rating;
    data['price'] = this.price;
    data['favorite'] = this.favorite;

    return data;
  }
}
