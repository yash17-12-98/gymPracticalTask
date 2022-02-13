class PopularClasses {
  String? title;
  String? image;
  String? price;
  bool? favorite;
  String? location;
  String? time;


  PopularClasses(
      {this.title,
        this.image,
        this.price,
        this.favorite,
        this.location,
        this.time,});

  PopularClasses.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    price = json['price'];
    favorite = json['favorite'];
    location = json['location'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['price'] = this.price;
    data['favorite'] = this.favorite;
    data['location'] = this.location;
    data['time'] = this.time;

    return data;
  }
}
