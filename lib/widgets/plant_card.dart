import 'package:flutter/material.dart';
import 'package:san_patricio/models/PlantProduct.dart';
import 'package:san_patricio/pages/plant_details_page.dart';
import 'package:san_patricio/widgets/add_to_cart_button.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({Key? key, required this.plant, required this.color})
      : super(key: key);
  final PlantProduct plant;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 200,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: Hero(
              tag: "${plant.name}-bg",
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            bottom: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${plant.name}-image",
                  child: Image.asset(
                    plant.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Text(
                      plant.name,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
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
          )
        ],
      ),
    );
  }
}
