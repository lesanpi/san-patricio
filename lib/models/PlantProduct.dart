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
  final int units;
}
