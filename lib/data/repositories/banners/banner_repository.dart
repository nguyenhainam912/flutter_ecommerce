// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommt/data/services/firebase_storage_service.dart';
import 'package:ecommt/features/shop/models/banner_model.dart';
import 'package:ecommt/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommt/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// var
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _db
          .collection("Banners")
          .where("Active", isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something sent wrong. Please try again";
    }
  }

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
        final url =
            await storage.uploadImageData("Banners", file, banner.imageUrl);

        banner.imageUrl = url;

        await _db.collection("Banners").doc().set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something sent wrong. Please try again";
    }
  }
}
