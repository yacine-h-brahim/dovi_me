class Project {
  String? id;
  String? customerName;
  String? ownerId;
  DateTime? dateTime;
  num? discount;
  num? subTotal;
  num? total;
  Project({
    required this.id,
    this.customerName,
    this.ownerId,
    this.dateTime,
    this.discount,
    this.subTotal,
    this.total,
  });
}
