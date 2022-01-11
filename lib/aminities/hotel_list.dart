class HotelList{
  String? docId;
  String? name;
  String? price;
  String? image;
  String? a1;
  String? status;
  String? a2;
  String? a4;
  String? a3;
  bool? isBooked;
  List<dynamic>? bookingId;

  HotelList({
    this.docId,
    this.name,
    this.price,
    this.image,
    this.status,
    this.a1,
    this.a2,
    this.a3,
    this.a4,
    this.isBooked,
    this.bookingId,
  });
}