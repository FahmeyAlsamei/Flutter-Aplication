class Category {
  Category({
    this.id,
    this.url,
    this.Name,
    this.price,
    this.image,
    this.dateUpdate,
    this.dateAdded,
  });

  int? id;
  String? url;
  String? Name;
  String? image;
  // String? Level;
  // String? price;
  double? price;
  DateTime? dateUpdate;
  DateTime? dateAdded;
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        url: json["url"],
        Name: json["Name"],
        image: json["image"],
// price: ,
        price: json["price"],

        dateUpdate: json["Date_Update"] != null
            ? DateTime.parse(json["Date_Update"])
            : null,
        dateAdded: json["Date_Added"] != null
            ? DateTime.parse(json["Date_Added"])
            : null,
      );

  // factory Category.fromJsonForSaveNewComercial(Map<String, dynamic> json) => Category(
  //   id: json["id"],
  //   url: json["url"],
  //   Name: json["Name"],
  //   NameEn: json["Name_EN"] == null ? null : json["Name_EN"],
  //   imagesNameProdact: json["images_Name_ComercialActivies"],
  //   dateUpdate:json["Date_Update"]!=null?DateTime.parse(json["Date_Update"]):null,
  //   dateAdded:json["Date_Added"]!=null? DateTime.parse(json["Date_Added"]):null,
  // );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "url": url,
        "Name": Name,
        "image": image,
        "price": price,

        "Date_Updat": dateUpdate?.toIso8601String(),
        "Date_Added": dateAdded?.toIso8601String(),
      };
}
