enum TableStatus {
  active,
  completed,
  cancelled,
}

class Table {
  final String id;
  final String name;
  final String createdBy;
  final DateTime createdAt;
  final TableStatus status;
  final double totalAmount;
  final String? receiptImageUrl;
  final List<String> participantIds;
  final Map<String, List<String>> itemAssignments; // userId -> itemIds
  final Map<String, double> participantTotals; // userId -> amount

  Table({
    required this.id,
    required this.name,
    required this.createdBy,
    required this.createdAt,
    this.status = TableStatus.active,
    this.totalAmount = 0.0,
    this.receiptImageUrl,
    this.participantIds = const [],
    this.itemAssignments = const {},
    this.participantTotals = const {},
  });

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      id: json['id'],
      name: json['name'],
      createdBy: json['createdBy'],
      createdAt: DateTime.parse(json['createdAt']),
      status: TableStatus.values.firstWhere(
        (e) => e.toString() == 'TableStatus.${json['status']}',
        orElse: () => TableStatus.active,
      ),
      totalAmount: (json['totalAmount'] ?? 0.0).toDouble(),
      receiptImageUrl: json['receiptImageUrl'],
      participantIds: List<String>.from(json['participantIds'] ?? []),
      itemAssignments: Map<String, List<String>>.from(
        json['itemAssignments'] ?? {},
      ),
      participantTotals: Map<String, double>.from(
        json['participantTotals'] ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'status': status.toString().split('.').last,
      'totalAmount': totalAmount,
      'receiptImageUrl': receiptImageUrl,
      'participantIds': participantIds,
      'itemAssignments': itemAssignments,
      'participantTotals': participantTotals,
    };
  }

  Table copyWith({
    String? id,
    String? name,
    String? createdBy,
    DateTime? createdAt,
    TableStatus? status,
    double? totalAmount,
    String? receiptImageUrl,
    List<String>? participantIds,
    Map<String, List<String>>? itemAssignments,
    Map<String, double>? participantTotals,
  }) {
    return Table(
      id: id ?? this.id,
      name: name ?? this.name,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      receiptImageUrl: receiptImageUrl ?? this.receiptImageUrl,
      participantIds: participantIds ?? this.participantIds,
      itemAssignments: itemAssignments ?? this.itemAssignments,
      participantTotals: participantTotals ?? this.participantTotals,
    );
  }
} 