class RestauranteModel {
  final int id;
  final String name;
  final String primaryColor;
  final String secondaryColor;

  RestauranteModel({
    required this.id,
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
  });

  factory RestauranteModel.fromJson(Map<String, dynamic> json) {
    return RestauranteModel(
      id: json['_id'],
      name: json['name'],
      primaryColor: json['primary_color'],
      secondaryColor: json['secondary_color'],
    );
  }
}

class SecaoModel {
  final int id;
  final String title;

  SecaoModel({required this.id, required this.title});

  factory SecaoModel.fromJson(Map<String, dynamic> json) {
    return SecaoModel(
      id: json['_id'],
      title: json['title'],
    );
  }
}

class ItemModel {
  final int id;
  final String name;
  final String description;
  final double price;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
