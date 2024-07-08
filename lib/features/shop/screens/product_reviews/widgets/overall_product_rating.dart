import 'package:ecommt/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.7",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                value: 1.0,
                text: '5',
              ),
              TRatingProgressIndicator(
                value: 0.8,
                text: '4',
              ),
              TRatingProgressIndicator(
                value: 0.6,
                text: '3',
              ),
              TRatingProgressIndicator(
                value: 0.4,
                text: '2',
              ),
              TRatingProgressIndicator(
                value: 0.2,
                text: '1',
              ),
            ],
          ),
        )
      ],
    );
  }
}
