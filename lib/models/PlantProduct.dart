class PlantProduct {
  PlantProduct(
      {required this.name,
      required this.price,
      required this.image,
      required this.description,
      this.units = 0});
  final String name;
  final double price;
  final String image;
  final String description;
  int units;

  void dicreaseUnits() {
    if (units > 0) {
      units--;
    }
  }

  void increaseUnits() {
    units++;
  }
}
