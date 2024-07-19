// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/appbar/tabbar.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/product_cart/cart_menu_item.dart';
import 'package:ecommt/common/widgets/brands/brand_card.dart';
import 'package:ecommt/common/widgets/shimmer/brands_shimmer.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/controllers/brand_controller.dart';
import 'package:ecommt/features/shop/controllers/category_controller.dart';
import 'package:ecommt/features/shop/screens/brand/all_brands.dart';
import 'package:ecommt/features/shop/screens/brand/brand_products.dart';
import 'package:ecommt/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
            title: Text("Store",
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [TCartCounterIcon()]),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          // search bar
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          TSearchContainer(
                              text: "Search In Store",
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),

                          // featured brands
                          TSectionHeading(
                            title: "Featured Brands",
                            onPressed: () => Get.to(() => AllBrandsScreen()),
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          // brand grid
                          Obx(() {
                            if (brandController.isLoading.value)
                              return TBrandsShimmer();

                            if (brandController.featuredBrands.isEmpty)
                              return Center(
                                child: Text("No Data Found!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white)),
                              );
                            return TGridLayout(
                                itemCount:
                                    brandController.featuredBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  final brand =
                                      brandController.featuredBrands[index];
                                  return TBrandCard(
                                    showBorder: true,
                                    brand: brand,
                                    onTap: () => Get.to(
                                        () => BrandProducts(brand: brand)),
                                  );
                                });
                          }),

                          //
                        ],
                      )),

                  // tab
                  bottom: TTabBar(
                      tabs: categories
                          .map((category) => Tab(
                                child: Text(category.name),
                              ))
                          .toList()),
                )
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => TCategoryTab(category: category))
                    .toList())),
      ),
    );
  }
}
