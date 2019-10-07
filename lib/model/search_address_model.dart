class PoiItem {
  String adCode;
  String adName;
  String businessArea;
  String cityCode;
  String cityName;
  String direction;
  int distance;
  String email;
  IndoorData indoorData;
  bool isIndoorMap;
  LatLonPoint latLonPoint;
  String parkingType;
  List<Photos> photos;
  PoiExtension poiExtension;
  String poild;
  String postcode;
  String provinceCode;
  String provinceName;
  String shopId;
  String snippet;
  List subPois;
  String tel;
  String title;
  String typeCode;
  String typeDes;
  String website;
  String gridCode;

  PoiItem(
      {this.adCode,
      this.adName,
      this.businessArea,
      this.cityCode,
      this.cityName,
      this.direction,
      this.distance,
      this.email,
      this.indoorData,
      this.isIndoorMap,
      this.latLonPoint,
      this.parkingType,
      this.photos,
      this.poiExtension,
      this.poild,
      this.postcode,
      this.provinceCode,
      this.provinceName,
      this.shopId,
      this.snippet,
      this.subPois,
      this.tel,
      this.title,
      this.typeCode,
      this.typeDes,
      this.website,
      this.gridCode});

  PoiItem.fromJson(Map<String, dynamic> json) {
    adCode = json['adCode'];
    adName = json['adName'];
    businessArea = json['businessArea'];
    cityCode = json['cityCode'];
    cityName = json['cityName'];
    direction = json['direction'];
    distance = json['distance'];
    email = json['email'];
    indoorData = json['indoorData'] != null
        ? new IndoorData.fromJson(json['indoorData'])
        : null;
    isIndoorMap = json['isIndoorMap'];
    latLonPoint = json['latLonPoint'] != null
        ? new LatLonPoint.fromJson(json['latLonPoint'])
        : null;
    parkingType = json['parkingType'];
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    poiExtension = json['poiExtension'] != null
        ? new PoiExtension.fromJson(json['poiExtension'])
        : null;
    poild = json['poild'];
    postcode = json['postcode'];
    provinceCode = json['provinceCode'];
    provinceName = json['provinceName'];
    shopId = json['shopId'];
    snippet = json['snippet'];
    if (json['subPois'] != null) {
      subPois = json['subPois'];
    }
    tel = json['tel'];
    title = json['title'];
    typeCode = json['typeCode'];
    typeDes = json['typeDes'];
    website = json['website'];
    gridCode = json['gridCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adCode'] = this.adCode;
    data['adName'] = this.adName;
    data['businessArea'] = this.businessArea;
    data['cityCode'] = this.cityCode;
    data['cityName'] = this.cityName;
    data['direction'] = this.direction;
    data['distance'] = this.distance;
    data['email'] = this.email;
    if (this.indoorData != null) {
      data['indoorData'] = this.indoorData.toJson();
    }
    data['isIndoorMap'] = this.isIndoorMap;
    if (this.latLonPoint != null) {
      data['latLonPoint'] = this.latLonPoint.toJson();
    }
    data['parkingType'] = this.parkingType;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    if (this.poiExtension != null) {
      data['poiExtension'] = this.poiExtension.toJson();
    }
    data['poild'] = this.poild;
    data['postcode'] = this.postcode;
    data['provinceCode'] = this.provinceCode;
    data['provinceName'] = this.provinceName;
    data['shopId'] = this.shopId;
    data['snippet'] = this.snippet;
    if (this.subPois != null) {
      data['subPois'] = this.subPois.map((v) => v.toJson()).toList();
    }
    data['tel'] = this.tel;
    data['title'] = this.title;
    data['typeCode'] = this.typeCode;
    data['typeDes'] = this.typeDes;
    data['website'] = this.website;
    data['gridCode'] = this.gridCode;
    return data;
  }
}

class IndoorData {
  int floor;
  String floorName;
  String poild;

  IndoorData({this.floor, this.floorName, this.poild});

  IndoorData.fromJson(Map<String, dynamic> json) {
    floor = json['floor'];
    floorName = json['floorName'];
    poild = json['poild'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor'] = this.floor;
    data['floorName'] = this.floorName;
    data['poild'] = this.poild;
    return data;
  }
}

class LatLonPoint {
  int latitude;
  int longtitude;

  LatLonPoint({this.latitude, this.longtitude});

  LatLonPoint.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longtitude = json['longtitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longtitude'] = this.longtitude;
    return data;
  }
}

class Photos {
  String title;
  String url;

  Photos({this.title, this.url});

  Photos.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class PoiExtension {
  String opentime;
  String rating;
  String cost;

  PoiExtension({this.opentime, this.rating, this.cost});

  PoiExtension.fromJson(Map<String, dynamic> json) {
    opentime = json['opentime'];
    rating = json['rating'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['opentime'] = this.opentime;
    data['rating'] = this.rating;
    data['cost'] = this.cost;
    return data;
  }
}




class NowLocationModel {
  int accuracy;
  String adCode;
  String address;
  int altitude;
  String aoiName;
  int bearing;
  String buildingId;
  String city;
  String cityCode;
  String coordType;
  String country;
  String district;
  int errorCode;
  String errorInfo;
  int floor;
  int gpsAccuracyStatus;
  bool isFixLastLocation;
  bool isMock;
  bool isOffset;
  double latitude;
  String locationDetail;
  LocationQualityReport locationQualityReport;
  int locationType;
  double longitude;
  String poiName;
  String provider;
  String province;
  int satellites;
  int speed;
  String street;
  String streetNum;
  int trustedLevel;

  NowLocationModel(
      {this.accuracy,
      this.adCode,
      this.address,
      this.altitude,
      this.aoiName,
      this.bearing,
      this.buildingId,
      this.city,
      this.cityCode,
      this.coordType,
      this.country,
      this.district,
      this.errorCode,
      this.errorInfo,
      this.floor,
      this.gpsAccuracyStatus,
      this.isFixLastLocation,
      this.isMock,
      this.isOffset,
      this.latitude,
      this.locationDetail,
      this.locationQualityReport,
      this.locationType,
      this.longitude,
      this.poiName,
      this.provider,
      this.province,
      this.satellites,
      this.speed,
      this.street,
      this.streetNum,
      this.trustedLevel});

  NowLocationModel.fromJson(Map<String, dynamic> json) {
    accuracy = json['accuracy'];
    adCode = json['adCode'];
    address = json['address'];
    altitude = json['altitude'];
    aoiName = json['aoiName'];
    bearing = json['bearing'];
    buildingId = json['buildingId'];
    city = json['city'];
    cityCode = json['cityCode'];
    coordType = json['coordType'];
    country = json['country'];
    district = json['district'];
    errorCode = json['errorCode'];
    errorInfo = json['errorInfo'];
    floor = json['floor'];
    gpsAccuracyStatus = json['gpsAccuracyStatus'];
    isFixLastLocation = json['isFixLastLocation'];
    isMock = json['isMock'];
    isOffset = json['isOffset'];
    latitude = json['latitude'];
    locationDetail = json['locationDetail'];
    locationQualityReport = json['locationQualityReport'] != null
        ? new LocationQualityReport.fromJson(json['locationQualityReport'])
        : null;
    locationType = json['locationType'];
    longitude = json['longitude'];
    poiName = json['poiName'];
    provider = json['provider'];
    province = json['province'];
    satellites = json['satellites'];
    speed = json['speed'];
    street = json['street'];
    streetNum = json['streetNum'];
    trustedLevel = json['trustedLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accuracy'] = this.accuracy;
    data['adCode'] = this.adCode;
    data['address'] = this.address;
    data['altitude'] = this.altitude;
    data['aoiName'] = this.aoiName;
    data['bearing'] = this.bearing;
    data['buildingId'] = this.buildingId;
    data['city'] = this.city;
    data['cityCode'] = this.cityCode;
    data['coordType'] = this.coordType;
    data['country'] = this.country;
    data['district'] = this.district;
    data['errorCode'] = this.errorCode;
    data['errorInfo'] = this.errorInfo;
    data['floor'] = this.floor;
    data['gpsAccuracyStatus'] = this.gpsAccuracyStatus;
    data['isFixLastLocation'] = this.isFixLastLocation;
    data['isMock'] = this.isMock;
    data['isOffset'] = this.isOffset;
    data['latitude'] = this.latitude;
    data['locationDetail'] = this.locationDetail;
    if (this.locationQualityReport != null) {
      data['locationQualityReport'] = this.locationQualityReport.toJson();
    }
    data['locationType'] = this.locationType;
    data['longitude'] = this.longitude;
    data['poiName'] = this.poiName;
    data['provider'] = this.provider;
    data['province'] = this.province;
    data['satellites'] = this.satellites;
    data['speed'] = this.speed;
    data['street'] = this.street;
    data['streetNum'] = this.streetNum;
    data['trustedLevel'] = this.trustedLevel;
    return data;
  }
}

class LocationQualityReport {
  String adviseMessage;
  int gpsSatellites;
  int gpsStatus;
  bool isWifiAble;
  int netUseTime;
  String networkType;

  LocationQualityReport(
      {this.adviseMessage,
      this.gpsSatellites,
      this.gpsStatus,
      this.isWifiAble,
      this.netUseTime,
      this.networkType});

  LocationQualityReport.fromJson(Map<String, dynamic> json) {
    adviseMessage = json['adviseMessage'];
    gpsSatellites = json['gpsSatellites'];
    gpsStatus = json['gpsStatus'];
    isWifiAble = json['isWifiAble'];
    netUseTime = json['netUseTime'];
    networkType = json['networkType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adviseMessage'] = this.adviseMessage;
    data['gpsSatellites'] = this.gpsSatellites;
    data['gpsStatus'] = this.gpsStatus;
    data['isWifiAble'] = this.isWifiAble;
    data['netUseTime'] = this.netUseTime;
    data['networkType'] = this.networkType;
    return data;
  }
}