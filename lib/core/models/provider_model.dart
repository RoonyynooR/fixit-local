import 'package:localservice/core/models/user_model.dart';

class ProviderModel extends UserModel {
  final double rating;
  final String specialty;
  final String category;
  final double distance;
  final double pricePerHour;
  final bool isTopRated;
  final String? about;
  final List<String>? servicesOffered;

  ProviderModel({
    required super.uId,
    required super.name,
    required super.email,
    required super.phone,
    required super.role,
    super.imageUrl,
    required this.rating,
    required this.specialty,
    required this.category,
    required this.distance,
    required this.pricePerHour,
    required this.isTopRated,
    this.about,
    this.servicesOffered,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic val) {
      if (val == null) return 0.0;
      if (val is num) return val.toDouble();
      return double.tryParse(val.toString()) ?? 0.0;
    }

    return ProviderModel(
      uId: json['uId'] ?? json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? 'provider',
      imageUrl: json['imageUrl'] ?? json['image'],
      rating: parseDouble(json['rating']),
      specialty: json['specialty'] ?? '',
      category: json['category'] ?? '',
      distance: parseDouble(json['distance']),
      pricePerHour: parseDouble(json['pricePerHour']),
      isTopRated: json['isTopRated'] ?? false,
      about: json['about'],
      servicesOffered: json['servicesOffered'] != null
          ? List<String>.from(json['servicesOffered'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['rating'] = rating;
    data['specialty'] = specialty;
    data['category'] = category;
    data['distance'] = distance;
    data['pricePerHour'] = pricePerHour;
    data['isTopRated'] = isTopRated;
    data['about'] = about;
    data['servicesOffered'] = servicesOffered;
    return data;
  }
}
