import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingProductCard extends StatelessWidget {
  const LoadingProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade400,
      ),
      enableSwitchAnimation: true,
      containersColor: Colors.black,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bone.square(
            size: 224,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          SizedBox(
            height: 5,
          ),
          Bone.text(
            fontSize: 16,
            words: 2,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          SizedBox(
            height: 5,
          ),
          Bone.text(
            fontSize: 16,
            words: 1,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ],
      ),
    );
  }
}
