class Merch {
  String name;
  String artist;
  String desc;
  String merchtype;
  String category;
  String fandom;
  String price;
  String imagePath;
  String rating;

  Merch({
    required this.name,
    required this.artist,
    required this.desc,
    required this.merchtype,
    required this.category,
    required this.fandom,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  String get _name => name;
  String get _artist => artist;
  String get _desc => desc;
  String get _merchtype => merchtype;
  String get _category => category;
  String get _fandom => fandom;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
}
