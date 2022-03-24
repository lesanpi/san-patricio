import 'package:flutter/material.dart';
import 'package:san_patricio/bloc/plant_bloc.dart';
import 'package:san_patricio/widgets/count_ballon.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = PlantProvider.of(context)!.bloc;

    return AppBar(
      toolbarHeight: 150,
      elevation: 0,
      backgroundColor: Colors.white,
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
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Vivero",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "San Patricio",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "el lugar de las plantas",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
