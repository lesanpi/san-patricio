import 'package:flutter/material.dart';
import 'package:san_patricio/models/PlantProduct.dart';
import 'package:san_patricio/widgets/circle_button.dart';
import 'package:san_patricio/widgets/my_app_bar.dart';

class PlantDetailsPage extends StatefulWidget {
  const PlantDetailsPage({Key? key, required this.plant, required this.color})
      : super(key: key);
  final PlantProduct plant;
  final Color color;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          widget.plant.name,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black87,
              ),
              iconSize: 50,
              splashRadius: 35.0,
              hoverColor: Colors.black12,
            ),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: "${widget.plant.name}-bg",
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100, bottom: 0),
                            child: Container(
                              width: size.width * 0.5,
                              height: 300,
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: -20,
                          right: 0,
                          child: Hero(
                            tag: "${widget.plant.name}-image",
                            child: Image.asset(
                              widget.plant.image,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.plant.name,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          widget.plant.description,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleButton(onTap: () {}, text: "-", size: 60),
                          Text(
                            widget.plant.units.toString(),
                            style: TextStyle(fontSize: 45),
                          ),
                          CircleButton(onTap: () {}, text: "+", size: 60)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
