import 'package:flutter/material.dart';
import 'package:san_patricio/models/PlantProduct.dart';
import 'package:san_patricio/pages/plant_details_page.dart';
import 'package:san_patricio/utils/constants.dart';
import 'package:san_patricio/widgets/my_app_bar.dart';
import 'package:san_patricio/widgets/plant_card.dart';

const _initialPage = 3.0;

List<PlantProduct> products = [
  PlantProduct(
    name: "Planta",
    price: 7,
    image: 'assets/plant.png',
    description:
        "Descripcion de la planta, es una planta muy bonita, que requiere mucha agua. Si la quieres, recuerda no ponerla tanto tiempo al sol y mantenerla hidratada. Requiere mucho amor y paciencia.",
  ),
  PlantProduct(
    name: "Planta 2",
    price: 7,
    image: 'assets/plant.png',
    description:
        "Descripcion de la planta, es una planta muy bonita, que requiere mucha agua. Si la quieres, recuerda no ponerla tanto tiempo al sol y mantenerla hidratada. Requiere mucho amor y paciencia.",
  ),
  PlantProduct(
    name: "Planta 3",
    price: 7,
    image: 'assets/plant.png',
    description:
        "Descripcion de la planta, es una planta muy bonita, que requiere mucha agua. Si la quieres, recuerda no ponerla tanto tiempo al sol y mantenerla hidratada. Requiere mucho amor y paciencia.",
  ),
  PlantProduct(
    name: "Planta 4",
    price: 7,
    image: 'assets/plant.png',
    description:
        "Descripcion de la planta, es una planta muy bonita, que requiere mucha agua. Si la quieres, recuerda no ponerla tanto tiempo al sol y mantenerla hidratada. Requiere mucho amor y paciencia.",
  ),
  PlantProduct(
    name: "Planta 5",
    price: 7,
    image: 'assets/plant.png',
    description:
        "Descripcion de la planta, es una planta muy bonita, que requiere mucha agua. Si la quieres, recuerda no ponerla tanto tiempo al sol y mantenerla hidratada. Requiere mucho amor y paciencia.",
  ),
  PlantProduct(
    name: "Planta 6",
    price: 7,
    image: 'assets/plant.png',
    description:
        "Descripcion de la planta, es una planta muy bonita, que requiere mucha agua. Si la quieres, recuerda no ponerla tanto tiempo al sol y mantenerla hidratada. Requiere mucho amor y paciencia.",
  ),
  PlantProduct(
    name: "Planta 7",
    price: 7,
    image: 'assets/plant.png',
    description:
        "Descripcion de la planta, es una planta muy bonita, que requiere mucha agua. Si la quieres, recuerda no ponerla tanto tiempo al sol y mantenerla hidratada. Requiere mucho amor y paciencia.",
  )
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageProductController = PageController(
    viewportFraction: 0.40,
    initialPage: _initialPage.toInt(),
  );
  final currentPage = ValueNotifier<double>(_initialPage);
  @override
  void initState() {
    currentPage.value = _initialPage;
    pageProductController.addListener(_productScollListener);

    super.initState();
  }

  void _productScollListener() {
    currentPage.value = pageProductController.page ?? currentPage.value;
  }

  @override
  void dispose() {
    pageProductController.removeListener(_productScollListener);
    pageProductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: const MyAppBar(),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ValueListenableBuilder<double>(
            valueListenable: currentPage,
            builder: (context, currentPage, _) {
              return Container(
                width: size.width,
                // color: Colors.red,
                height: size.height - 120,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          "🪴 Nuestras plantas",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: size.height - 240,
                          width: 300 + 400,
                          child: PageView.builder(
                            controller: pageProductController,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final plant = products[index];
                              final result = currentPage - index;
                              final sizeScale = -0.3 * result.abs() + 1;
                              // final opacity = sizeScale.clamp(0.0, 1.0);
                              final color = productColors[
                                  (index + 1) % productColors.length];

                              return GestureDetector(
                                onTap: () {
                                  print(plant.name);
                                  Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, animation, _) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: PlantDetailsPage(
                                          plant: plant,
                                          color: color,
                                        ),
                                      );
                                    },
                                  ));
                                },
                                child: Transform(
                                  alignment: Alignment.bottomCenter,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..translate(
                                      0.0,
                                      0.0,
                                    )
                                    ..scale(sizeScale),
                                  child: PlantCard(
                                    plant: plant,
                                    color: color,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
