// class Product{
//   final int id;
//   final String name;
//   final String category;
//   final String image;
//   final String description;
//   final double price;
//   int quantity;
//
//   Product({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.image,
//     required this.description,
//     required this.price,
//     required this.quantity
//   });
// }



class Product {
  final int id;
  final String name;
  final String category;
  final String image;
  final String description;
  final double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.price,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(), // ensures double
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is Product && other.id == id);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode;
}
