class MealStatistics {
  final int id;
  final int foodId;
  final DateTime orderDate;
  final int quantity;
  final String status;
  final DateTime createdAt;
  final String nameFood;
  final double price;
  final String imageUrl;
  final int totalPrice;

  MealStatistics({
    required this.id,
    required this.foodId,
    required this.orderDate,
    required this.quantity,
    required this.status,
    required this.createdAt,
    required this.nameFood,
    required this.price,
    required this.imageUrl,
    required this.totalPrice,
  });

  factory MealStatistics.fromJson(Map<String, dynamic> json) {
    return MealStatistics(
      id: json['id'] as int,
      foodId: json['food_id'] as int,
      orderDate: DateTime.parse(json['order_date'] as String),
      quantity: json['quantity'] as int,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      nameFood: json['name_food'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String,
      totalPrice: json['total_price'] as int,
    );
  }

  // Chuyển đổi thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food_id': foodId,
      'order_date': orderDate.toIso8601String(),
      'quantity': quantity,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'name_food': nameFood,
      'price': price,
      'image_url': imageUrl,
      'total_price': totalPrice,
    };
  }
}
