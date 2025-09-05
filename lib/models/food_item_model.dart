import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  final int id;
  final String nameFood;
  final String description;
  final double price;
  final String imageUrl;
  final DateTime availableDate;
  final DateTime createdAt;
  final bool isOrdered;

  const FoodItem({
    required this.id,
    required this.nameFood,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.availableDate,
    required this.createdAt,
    required this.isOrdered,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'] as int,
      nameFood: json['name_food'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String,
      availableDate: DateTime.parse(json['available_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      isOrdered: (json['is_ordered'] as int) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_food': nameFood,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'available_date': availableDate.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'is_ordered': isOrdered ? 1 : 0,
    };
  }

  FoodItem copyWith({
    int? id,
    String? nameFood,
    String? description,
    double? price,
    String? imageUrl,
    DateTime? availableDate,
    DateTime? createdAt,
    bool? isOrdered,
  }) {
    return FoodItem(
      id: id ?? this.id,
      nameFood: nameFood ?? this.nameFood,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      availableDate: availableDate ?? this.availableDate,
      createdAt: createdAt ?? this.createdAt,
      isOrdered: isOrdered ?? this.isOrdered,
    );
  }

  @override
  List<Object?> get props => [
    id,
    nameFood,
    description,
    price,
    imageUrl,
    availableDate,
    createdAt,
    isOrdered,
  ];
}
