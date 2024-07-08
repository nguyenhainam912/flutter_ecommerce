import 'package:ecommt/common/widgets/appbar/appbar.dart';
import 'package:ecommt/features/shop/screens/order/widgets/order_list_item.dart';
import 'package:ecommt/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///appbar
        appBar: TAppBar(
          title: Text("My Orders",
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),

            ///orders
            child: TOrderListItem()));
  }
}
