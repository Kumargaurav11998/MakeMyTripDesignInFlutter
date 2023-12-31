class SearchDestinationModal {
  List<Data>? data;

  SearchDestinationModal({this.data});

  SearchDestinationModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? type;
  String? subType;
  String? name;
  String? detailedName;
  String? id;
  Self? self;
  String? timeZoneOffset;
  String? iataCode;
  GeoCode? geoCode;
  Address? address;
  Analytics? analytics;

  Data(
      {this.type,
        this.subType,
        this.name,
        this.detailedName,
        this.id,
        this.self,
        this.timeZoneOffset,
        this.iataCode,
        this.geoCode,
        this.address,
        this.analytics});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subType = json['subType'];
    name = json['name'];
    detailedName = json['detailedName'];
    id = json['id'];
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    timeZoneOffset = json['timeZoneOffset'];
    iataCode = json['iataCode'];
    geoCode =
    json['geoCode'] != null ? new GeoCode.fromJson(json['geoCode']) : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    analytics = json['analytics'] != null
        ? new Analytics.fromJson(json['analytics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['subType'] = this.subType;
    data['name'] = this.name;
    data['detailedName'] = this.detailedName;
    data['id'] = this.id;
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    data['timeZoneOffset'] = this.timeZoneOffset;
    data['iataCode'] = this.iataCode;
    if (this.geoCode != null) {
      data['geoCode'] = this.geoCode!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.analytics != null) {
      data['analytics'] = this.analytics!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;
  List<String>? methods;

  Self({this.href, this.methods});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    methods = json['methods'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['methods'] = this.methods;
    return data;
  }
}

class GeoCode {
  double? latitude;
  double? longitude;

  GeoCode({this.latitude, this.longitude});

  GeoCode.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Address {
  String? cityName;
  String? cityCode;
  String? countryName;
  String? countryCode;
  String? stateCode;
  String? regionCode;

  Address(
      {this.cityName,
        this.cityCode,
        this.countryName,
        this.countryCode,
        this.stateCode,
        this.regionCode});

  Address.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    cityCode = json['cityCode'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    stateCode = json['stateCode'];
    regionCode = json['regionCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityName'] = this.cityName;
    data['cityCode'] = this.cityCode;
    data['countryName'] = this.countryName;
    data['countryCode'] = this.countryCode;
    data['stateCode'] = this.stateCode;
    data['regionCode'] = this.regionCode;
    return data;
  }
}

class Analytics {
  Travelers? travelers;

  Analytics({this.travelers});

  Analytics.fromJson(Map<String, dynamic> json) {
    travelers = json['travelers'] != null
        ? new Travelers.fromJson(json['travelers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.travelers != null) {
      data['travelers'] = this.travelers!.toJson();
    }
    return data;
  }
}

class Travelers {
  int? score;

  Travelers({this.score});

  Travelers.fromJson(Map<String, dynamic> json) {
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    return data;
  }
}
