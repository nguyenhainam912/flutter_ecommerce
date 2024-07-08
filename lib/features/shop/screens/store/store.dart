// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/common/widgets/appbar/tabbar.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommt/common/widgets/layouts/grid_layout.dart';
import 'package:ecommt/common/widgets/product_cart/cart_menu_item.dart';
import 'package:ecommt/common/widgets/brands/brand_card.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/screens/brand/all_brands.dart';
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

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
            title: Text("Store",
                style: Theme.of(context).textTheme.headlineMedium),
            actions: [TCartCounterIcon(onPressed: () {})]),
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
                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return TBrandCard(
                                  showBorder: false,
                                );
                              }),

                          //
                        ],
                      )),

                  // tab
                  bottom: TTabBar(tabs: [
                    Tab(
                      text: "Sports",
                    ),
                    Tab(
                      text: "Furniture",
                    ),
                    Tab(
                      text: "Electronics",
                    ),
                    Tab(
                      text: "Clothes",
                    ),
                    Tab(
                      text: "Cosmetics",
                    ),
                  ]),
                )
              ];
            },
            body: TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            )),
      ),
    );
  }
}
