class ItemModel {
  int pid;
  String itemName;
  String itemType;
  int itemPrice;
  String location;
  String availableCount;
  String description;
  String timeOfAvailability;
  String imageId;

  ItemModel({
    required this.pid,
    required this.itemName,
    required this.itemType,
    required this.itemPrice,
    required this.location,
    required this.availableCount,
    required this.description,
    required this.timeOfAvailability,
    required this.imageId,
  });
}
