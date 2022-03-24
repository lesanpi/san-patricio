import 'package:flutter/material.dart';
import 'package:san_patricio/bloc/plant_bloc.dart';
import 'package:san_patricio/models/PlantProduct.dart';
import 'package:san_patricio/pages/plant_details_page.dart';
import 'package:san_patricio/utils/constants.dart';
import 'package:san_patricio/widgets/add_to_cart_button.dart';
import 'package:san_patricio/widgets/count_ballon.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({Key? key, required this.plant, required this.color})
      : super(key: key);
  final PlantProduct plant;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = PlantProvider.of(context)!.bloc;
    final _borderRadius = BorderRadius.circular(20);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 20),
              child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: _borderRadius,
                  ),
                  child: Column(children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        plant.name,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])),
            ),
            Positioned(
              bottom: 120,
              child: Hero(
                tag: "${plant.name}-image",
                child: Image.asset(
                  plant.image,
                  // fit: BoxFit.fitWidth,
                  // width: constraints.maxWidth * 1.1,
                  height: constraints.maxHeight * 0.70,
                  width: constraints.maxHeight * 0.70,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                child: Center(
                  child: AddToCartButton(
                    size: 30,
                    onTap: () {
                      print("Add to cart");
                    },
                  ),
                ),
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: bloc.unitsHomePage,
              builder: (BuildContext context, int value, Widget? child) {
                return Positioned(
                  top: 70,
                  right: 0,
                  child: CountBallon(value: plant.units),
                );
              },
            )
          ],
        );
      },
    );
  }
}
