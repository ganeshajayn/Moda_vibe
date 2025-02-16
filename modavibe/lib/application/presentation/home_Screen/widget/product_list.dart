import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/loadinganimationstagger/loading_animation.dart';
import 'package:modavibe/Model/product_model/productmodel.dart';

class Productcard extends StatelessWidget {
  const Productcard({super.key, required this.api});
  final Productfromapi api;

  get imageProvider => null;

  get url => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
                imageUrl: api.image[0],
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fitWidth)),
                  );
                },
                placeholder: (context, url) => const Center(
                      child: Loadinganimationstagger(),
                    )),
          )
        ],
      ),
    );
  }
}
