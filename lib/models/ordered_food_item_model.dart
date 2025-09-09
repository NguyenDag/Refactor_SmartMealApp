class OrderedFoodItem {
  final int id;
  final int foodId;
  final String nameFood;
  final int quantity;
  final DateTime orderDate;
  final String status;
  final DateTime createdAt;

  OrderedFoodItem({
    required this.id,
    required this.foodId,
    required this.nameFood,
    required this.quantity,
    required this.orderDate,
    required this.status,
    required this.createdAt,
  });

  factory OrderedFoodItem.fromJson(Map<String, dynamic> json) {
    return OrderedFoodItem(
      id: json['id'] as int,
      foodId: json['food_id'] as int,
      nameFood: json['name_food'] as String,
      quantity: json['quantity'] as int,
      orderDate: DateTime.parse(json['order_date'] as String),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food_id': foodId,
      'name_food': nameFood,
      'quantity': quantity,
      'order_date': orderDate.toIso8601String(),
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
