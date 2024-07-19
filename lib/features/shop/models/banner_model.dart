import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String targetScreen;
  String imageUrl;
  final bool active;

  BannerModel({
    required this.targetScreen,
    required this.imageUrl,
    required this.active,
  });

  static BannerModel empty() => BannerModel(
        targetScreen: '',
        imageUrl: '',
        active: false,
      );

  Map<String, dynamic> toJson() {
    return {
      "TargetScreen": targetScreen,
      "ImageUrl": imageUrl,
      "Active": active,
    };
  }

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BannerModel(
        targetScreen: data['TargetScreen'] ?? '',
        imageUrl: data['ImageUrl'] ?? '',
        active: data['Active'] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}
