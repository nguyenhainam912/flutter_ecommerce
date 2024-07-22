import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommt/data/services/firebase_storage_service.dart';
import 'package:ecommt/features/shop/models/brand_model.dart';
import 'package:ecommt/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommt/utils/exceptions/format_exceptions.dart';
import 'package:ecommt/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// var
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get all order related to current User
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Brands.';
    }
  }

  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();
      // Query to get all documents where the brandId is in the list of brand Ids, FieldPath.documentId to query documents in Collection
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();
      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Brands.';
    }
  }

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var brand in brands) {
        final file = await storage.getImageDataFromAssets(brand.image);
        final url = await storage.uploadImageData("Brands", file, brand.name);

        brand.image = url;

        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
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
