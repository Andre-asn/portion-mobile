class Item {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String? assignedTo; // userId
  final String tableId;

  Item({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.assignedTo,
    required this.tableId,
  });

  double get totalPrice => price * quantity;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: (json['price'] ?? 0.0).toDouble(),
      quantity: json['quantity'] ?? 1,
      assignedTo: json['assignedTo'],
      tableId: json['tableId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'assignedTo': assignedTo,
      'tableId': tableId,
    };
  }

  Item copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    String? assignedTo,
    String? tableId,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      assignedTo: assignedTo ?? this.assignedTo,
      tableId: tableId ?? this.tableId,
    );
  }
} 