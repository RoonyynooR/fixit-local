class UserModel {
  final String uId;
  final String name;
  final String email;
  final String phone;
  final String role; // 'customer' or 'provider'
  final String? imageUrl;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'] ?? json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? 'customer',
      imageUrl: json['imageUrl'] ?? json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'imageUrl': imageUrl,
    };
  }
}
