import 'package:ecommt/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommt/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommt/utils/constants/colors.dart';
import 'package:flutter/widgets.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
        child: Container(
      color: TColors.primary,
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -250,
            child: CircularContainer(
              backgroundColor: TColors.textWhite.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 100,
            right: -300,
            child: CircularContainer(
              backgroundColor: TColors.textWhite.withOpacity(0.1),
            ),
          ),
          child
        ],
      ),
    ));
  }
}
