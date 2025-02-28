import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/application/bussineslogic/category/category_bloc.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.radius});

  final double? radius;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CategoryLoaded) {
        return SizedBox(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (BuildContext context, index) {
                final categoris = state.categories[index];
                final imageurl =
                    (categoris.imageurl! == null || categoris.imageurl.isEmpty)
                        ? ""
                        : categoris.imageurl;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: radius,
                          backgroundImage: NetworkImage(imageurl),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(categoris.name)
                      ]),
                );
              }),
        );
      } else if (state is CategoryError) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      return const SizedBox();
    });
  }
}
