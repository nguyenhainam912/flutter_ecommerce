// ignore_for_file: prefer_const_constructors

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/data/repositories/banners/banner_repository.dart';
import 'package:ecommt/data/repositories/brands/brand_repository.dart';
import 'package:ecommt/data/repositories/categories/category_repository.dart';
import 'package:ecommt/data/repositories/product/product_repository.dart';
import 'package:ecommt/utils/dummy/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text("Upload Data"),
        ),
        body: Column(
          children: [
            /// category
            TRoundedContainer(
              showBorder: true,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upload Category"),
                  IconButton(
                      onPressed: () => Get.put(CategoryRepository.instance
                          .uploadDummyData(TDummyData.categories)),
                      icon: Icon(Icons.upload))
                ],
              ),
            ),

            /// banner
            TRoundedContainer(
              showBorder: true,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upload Banner"),
                  IconButton(
                      onPressed: () => Get.put(BannerRepository.instance
                          .uploadDummyData(TDummyData.banners)),
                      icon: Icon(Icons.upload))
                ],
              ),
            ),

            /// product
            TRoundedContainer(
              showBorder: true,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upload Product"),
                  IconButton(
                      onPressed: () {
                        final productRepository = Get.put(ProductRepository());
                        productRepository.uploadDummyData(TDummyData.products);
                      },
                      icon: Icon(Icons.upload))
                ],
              ),
            ),

            /// product
            TRoundedContainer(
              showBorder: true,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upload Brand"),
                  IconButton(
                      onPressed: () {
                        final brandRepository = Get.put(BrandRepository());
                        brandRepository.uploadDummyData(TDummyData.brands);
                      },
                      icon: Icon(Icons.upload))
                ],
              ),
            ),
          ],
        ));
  }
}
