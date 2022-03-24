import 'package:flutter/material.dart';
import 'package:san_patricio/models/PlantProduct.dart';

const _initialPage = 3.0;

class PlantBLoC {
  final currentPage = ValueNotifier<double>(_initialPage);
  final cartItemNumber = ValueNotifier<int>(0);

  final unitsHomePage = ValueNotifier<int>(0);

  final pageProductController = PageController(
    viewportFraction: 0.40,
    initialPage: _initialPage.toInt(),
  );

  List<PlantProduct> plants = [
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

  void init() {
    currentPage.value = _initialPage;
    unitsHomePage.value = plants[_initialPage.toInt()].units;
    cartItemNumber.value = 0;
    pageProductController.addListener(_productScollListener);
  }

  void dispose() {
    pageProductController.removeListener(_productScollListener);
    pageProductController.dispose();
  }

  void _productScollListener() {
    currentPage.value = pageProductController.page ?? currentPage.value;
    unitsHomePage.value = plants[currentPage.value.round()].units;
  }

  void decreaseProductUnit() {
    plants[currentPage.value.toInt()].dicreaseUnits();
    unitsHomePage.value = plants[currentPage.value.toInt()].units;
    if (cartItemNumber.value > 0) {
      cartItemNumber.value--;
    }
  }

  

  void increaseProductUnit() {
    plants[currentPage.value.toInt()].increaseUnits();
    unitsHomePage.value = plants[currentPage.value.toInt()].units;
    cartItemNumber.value++;
  }void selectItem(int index){
    currentPage.value = index.roundToDouble();
    // print(currentPage.value);
    // print(plants[currentPage.value.toInt()].name);
    //     print(plants[currentPage.value.toInt()].units);

  }
}

class PlantProvider extends InheritedWidget {
  final PlantBLoC bloc;

  PlantProvider({required this.bloc, required Widget child})
      : super(child: child);

  static PlantProvider? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<PlantProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
