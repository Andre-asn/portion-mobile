class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final DateTime createdAt;
  final List<String> buddyIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    required this.createdAt,
    this.buddyIds = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      buddyIds: List<String>.from(json['buddyIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'createdAt': createdAt.toIso8601String(),
      'buddyIds': buddyIds,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImageUrl,
    DateTime? createdAt,
    List<String>? buddyIds,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      buddyIds: buddyIds ?? this.buddyIds,
    );
  }
} 