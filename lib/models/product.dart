class Product {
  final int id;
  final String title;
  final String description;
  final String text;
  final String image;
  final List<String> information1;
  final List<String> information2;
  final List<String> information3;

  Product({this.id, this.title, this.description,this.text, this.image, this.information1, this.information2, this.information3});

  factory Product.fromJson(Map<String, dynamic> json){
    var infomation1Json = json['information1'];
    var infomation2Json = json['information2'];
    var infomation3Json = json['information3'];

    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      text:json['text'],
      image: json['image'],
      information1: infomation1Json.cast<String>(),
      information2: infomation2Json.cast<String>(),
      information3: infomation3Json.cast<String>(),
    );
  }
}