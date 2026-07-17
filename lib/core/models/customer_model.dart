import 'package:localservice/core/models/user_model.dart';

class CustomerModel extends UserModel {
  final String? address;

  CustomerModel({
    required super.uId,
    required super.name,
    required super.email,
    required super.phone,
    required super.role,
    super.imageUrl,
    this.address,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      uId: json['uId'] ?? json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? 'customer',
      imageUrl: json['imageUrl'] ?? json['image'],
      address: json['address'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['address'] = address;
    return data;
  }
}
