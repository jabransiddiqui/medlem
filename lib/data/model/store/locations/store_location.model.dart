import 'dart:convert';

StoreLocationModel storeLocationModelFromJson(String str) =>
    StoreLocationModel.fromJson(json.decode(str));

String storeLocationModelToJson(StoreLocationModel data) =>
    json.encode(data.toJson());

class StoreLocationModel {
  final Location? location;
  final List<Store>? stores;
  final List<Store>? additionalStores;
  final String? infoMessage;

  StoreLocationModel({
    this.location,
    this.stores,
    this.additionalStores,
    this.infoMessage,
  });

  factory StoreLocationModel.fromJson(Map<String, dynamic> json) =>
      StoreLocationModel(
        location: json["Location"] == null
            ? null
            : Location.fromJson(json["Location"]),
        stores: json["Stores"] == null
            ? []
            : List<Store>.from(json["Stores"]!.map((x) => Store.fromJson(x))),
        additionalStores: json["AdditionalStores"] == null
            ? []
            : List<Store>.from(
                json["AdditionalStores"]!.map((x) => Store.fromJson(x))),
        infoMessage: json["InfoMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Location": location?.toJson(),
        "Stores": stores == null
            ? []
            : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "AdditionalStores": additionalStores == null
            ? []
            : List<dynamic>.from(additionalStores!.map((x) => x.toJson())),
        "InfoMessage": infoMessage,
      };
}

class Store {
  final String? storeId;
  final String? name;
  final String? chain;
  final String? chainClassName;
  final String? chainId;
  final bool? isEcommerce;
  final String? newspaperUrl;
  final String? chainImage;
  final List<String>? inStoreServices;
  final double? lat;
  final double? lng;
  final String? openingHoursToday;
  final bool? openNow;
  final String? phone;
  final String? address;
  final String? city;
  final double? distance;
  final String? email;
  final String? sLag;
  final String? organizationNumber;
  final List<dynamic>? specialOpeningHours;
  final List<OpeningHour>? openingHours;
  final AdditionalInformation? additionalInformation;

  Store({
    this.storeId,
    this.name,
    this.chain,
    this.chainClassName,
    this.chainId,
    this.isEcommerce,
    this.newspaperUrl,
    this.chainImage,
    this.inStoreServices,
    this.lat,
    this.lng,
    this.openingHoursToday,
    this.openNow,
    this.phone,
    this.address,
    this.city,
    this.distance,
    this.email,
    this.sLag,
    this.organizationNumber,
    this.specialOpeningHours,
    this.openingHours,
    this.additionalInformation,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json["StoreId"],
        name: json["Name"],
        chain: json["Chain"],
        chainClassName: json["ChainClassName"],
        chainId: json["ChainId"],
        isEcommerce: json["IsEcommerce"],
        newspaperUrl: json["NewspaperUrl"],
        chainImage: json["ChainImage"],
        inStoreServices: json["InStoreServices"] == null
            ? []
            : List<String>.from(json["InStoreServices"]!.map((x) => x)),
        lat: json["Lat"]?.toDouble(),
        lng: json["Lng"]?.toDouble(),
        openingHoursToday: json["OpeningHoursToday"],
        openNow: json["OpenNow"],
        phone: json["Phone"],
        address: json["Address"],
        city: json["City"],
        distance: json["Distance"]?.toDouble(),
        email: json["Email"],
        sLag: json["SLag"],
        organizationNumber: json["OrganizationNumber"],
        specialOpeningHours: json["SpecialOpeningHours"] == null
            ? []
            : List<dynamic>.from(json["SpecialOpeningHours"]!.map((x) => x)),
        openingHours: json["OpeningHours"] == null
            ? []
            : List<OpeningHour>.from(
                json["OpeningHours"]!.map((x) => OpeningHour.fromJson(x))),
        additionalInformation: json["AdditionalInformation"] == null
            ? null
            : AdditionalInformation.fromJson(json["AdditionalInformation"]),
      );

  Map<String, dynamic> toJson() => {
        "StoreId": storeId,
        "Name": name,
        "Chain": chain,
        "ChainClassName": chainClassName,
        "ChainId": chainId,
        "IsEcommerce": isEcommerce,
        "NewspaperUrl": newspaperUrl,
        "ChainImage": chainImage,
        "InStoreServices": inStoreServices == null
            ? []
            : List<dynamic>.from(inStoreServices!.map((x) => x)),
        "Lat": lat,
        "Lng": lng,
        "OpeningHoursToday": openingHoursToday,
        "OpenNow": openNow,
        "Phone": phone,
        "Address": address,
        "City": city,
        "Distance": distance,
        "Email": email,
        "SLag": sLag,
        "OrganizationNumber": organizationNumber,
        "SpecialOpeningHours": specialOpeningHours == null
            ? []
            : List<dynamic>.from(specialOpeningHours!.map((x) => x)),
        "OpeningHours": openingHours == null
            ? []
            : List<dynamic>.from(openingHours!.map((x) => x.toJson())),
        "AdditionalInformation": additionalInformation?.toJson(),
      };
}

class AdditionalInformation {
  final List<Html>? html;

  AdditionalInformation({
    this.html,
  });

  factory AdditionalInformation.fromJson(Map<String, dynamic> json) =>
      AdditionalInformation(
        html: json["Html"] == null
            ? []
            : List<Html>.from(json["Html"]!.map((x) => Html.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Html": html == null
            ? []
            : List<dynamic>.from(html!.map((x) => x.toJson())),
      };
}

class Html {
  final String? tag;
  final List<String>? children;

  Html({
    this.tag,
    this.children,
  });

  factory Html.fromJson(Map<String, dynamic> json) => Html(
        tag: json["tag"],
        children: json["children"] == null
            ? []
            : List<String>.from(json["children"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}

class OpeningHour {
  final String? date;
  final String? openString;
  final String? day;
  final bool? closed;
  final bool? specialOpeningHours;

  OpeningHour({
    this.date,
    this.openString,
    this.day,
    this.closed,
    this.specialOpeningHours,
  });

  factory OpeningHour.fromJson(Map<String, dynamic> json) => OpeningHour(
        date: json["Date"],
        openString: json["OpenString"],
        day: json["Day"],
        closed: json["Closed"],
        specialOpeningHours: json["SpecialOpeningHours"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date,
        "OpenString": openString,
        "Day": day,
        "Closed": closed,
        "SpecialOpeningHours": specialOpeningHours,
      };
}

class Location {
  final dynamic bounds;
  final double? longitude;
  final double? latitude;

  Location({
    this.bounds,
    this.longitude,
    this.latitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        bounds: json["Bounds"],
        longitude: json["Longitude"]?.toDouble(),
        latitude: json["Latitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Bounds": bounds,
        "Longitude": longitude,
        "Latitude": latitude,
      };
}
