import 'package:flutter/material.dart';
import 'package:san_patricio/models/PlantProduct.dart';
import 'package:san_patricio/widgets/circle_button.dart';
import 'package:san_patricio/widgets/count_ballon.dart';
import 'package:san_patricio/widgets/my_app_bar.dart';
import 'package:san_patricio/bloc/plant_bloc.dart';

const _duration = Duration(milliseconds: 100);

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
    final bloc = PlantProvider.of(context)!.bloc;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          iconSize: 40,
          splashRadius: 25.0,
          hoverColor: Colors.black12,
        ),
        centerTitle: true,
        title: Text(
          widget.plant.name,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black87,
                  ),
                  iconSize: 50,
                  splashRadius: 35.0,
                  hoverColor: Colors.black12,
                ),
                Positioned(
                  top: 35,
                  right: 0,
                  child: ValueListenableBuilder(
                    valueListenable: bloc.cartItemNumber,
                    builder: (BuildContext context, int value, Widget? child) {
                      return CountBallon(
                        value: value,
                        color: Colors.redAccent,
                        size: 20,
                        fontSize: 12,
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double _padding = constraints.maxHeight * 0.1;
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Hero(
                          tag: "${widget.plant.name}-bg",
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: _padding, bottom: _padding),
                            child: Container(
                              width: constraints.maxWidth,
                              height: constraints.maxWidth,
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -20,
                          left: -20,
                          right: 0,
                          child: Hero(
                            tag: "${widget.plant.name}-image",
                            child: Image.asset(
                              widget.plant.image,
                              width: constraints.maxWidth,
                            ),
                          ),
                        )
                      ],
                    );
                  },
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
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Precio: ${widget.plant.price} \$",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                              onTap: bloc.decreaseProductUnit,
                              text: "-",
                              size: 55),
                          const SizedBox(
                            width: 20,
                          ),
                          ValueListenableBuilder(
                            valueListenable: bloc.unitsHomePage,
                            builder: (BuildContext context, int value,
                                Widget? child) {
                              return AnimatedSwitcher(
                                duration: _duration,
                                child: Text(
                                  widget.plant.units.toString(),
                                  style: TextStyle(fontSize: 45),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CircleButton(
                              onTap: bloc.increaseProductUnit,
                              text: "+",
                              size: 55)
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
