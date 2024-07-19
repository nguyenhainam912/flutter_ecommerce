// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters

import 'package:ecommt/common/widgets/chips/choice_chip.dart';
import 'package:ecommt/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommt/common/widgets/texts/product_price_text.dart';
import 'package:ecommt/common/widgets/texts/product_title_text.dart';
import 'package:ecommt/common/widgets/texts/section_heading.dart';
import 'package:ecommt/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommt/features/shop/models/product_model.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:ecommt/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          /// slected attribute pricing & description
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkGrey : TColors.grey,
              child: Column(
                children: [
                  /// title price stock status
                  Row(
                    children: [
                      TSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TProductTitleText(
                                title: "Price",
                                smallSize: true,
                              ),

                              // actual price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                    "\$${controller.selectedVariation.value.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough)),
                              SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),
                              // sale price
                              TProductPriceText(
                                price: controller.getVariationPrice(),
                              )
                            ],
                          ),

                          /// stock
                          Row(
                            children: [
                              TProductTitleText(
                                title: "Stock",
                                smallSize: true,
                              ),
                              Text(controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  /// variation description
                  TProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;

                              final avaliable = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);
                              return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: avaliable
                                      ? (selected) {
                                          if (selected && avaliable) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            }).toList(),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
