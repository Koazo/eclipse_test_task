class User {
  String? _id;
  String? _name;
  String? _username;
  String? _email;
  _Address? _address;
  String? _phone;
  String? _website;
  _Company? _company;

  User(
      {String? id,
      String? name,
      String? username,
      String? email,
      _Address? address,
      String? phone,
      String? website,
      _Company? company}) {
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _address = address;
    _phone = phone;
    _website = website;
    _company = company;
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;
  _Address? get address => _address;
  set address(_Address? address) => _address = address;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get website => _website;
  set website(String? website) => _website = website;
  _Company? get company => _company;
  set company(_Company? company) => _company = company;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _address =
        json['address'] != null ? _Address.fromJson(json['address']) : null;
    _phone = json['phone'];
    _website = json['website'];
    _company =
        json['company'] != null ? _Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['username'] = _username;
    data['email'] = _email;
    if (_address != null) {
      data['address'] = _address!.toJson();
    }
    data['phone'] = _phone;
    data['website'] = _website;
    if (_company != null) {
      data['company'] = _company!.toJson();
    }
    return data;
  }
}

class _Address {
  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  _Geo? _geo;

  _Address(
      {String? street,
      String? suite,
      String? city,
      String? zipcode,
      _Geo? geo}) {
    _street = street;
    _suite = suite;
    _city = city;
    _zipcode = zipcode;
    _geo = geo;
  }

  String? get street => _street;
  set street(String? street) => _street = street;
  String? get suite => _suite;
  set suite(String? suite) => _suite = suite;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get zipcode => _zipcode;
  set zipcode(String? zipcode) => _zipcode = zipcode;
  _Geo? get geo => _geo;
  set geo(_Geo? geo) => _geo = geo;

  _Address.fromJson(Map<String, dynamic> json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    _geo = json['geo'] != null ? _Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = _street;
    data['suite'] = _suite;
    data['city'] = _city;
    data['zipcode'] = _zipcode;
    if (_geo != null) {
      data['geo'] = _geo!.toJson();
    }
    return data;
  }
}

class _Geo {
  String? _lat;
  String? _lng;

  _Geo({String? lat, String? lng}) {
    _lat = lat;
    _lng = lng;
  }

  String? get lat => _lat;
  set lat(String? lat) => _lat = lat;
  String? get lng => _lng;
  set lng(String? lng) => _lng = lng;

  _Geo.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = _lat;
    data['lng'] = _lng;
    return data;
  }
}

class _Company {
  String? _name;
  String? _catchPhrase;
  String? _bs;

  _Company({String? name, String? catchPhrase, String? bs}) {
    _name = name;
    _catchPhrase = catchPhrase;
    _bs = bs;
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get catchPhrase => _catchPhrase;
  set catchPhrase(String? catchPhrase) => _catchPhrase = catchPhrase;
  String? get bs => _bs;
  set bs(String? bs) => _bs = bs;

  _Company.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _catchPhrase = json['catchPhrase'];
    _bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['catchPhrase'] = _catchPhrase;
    data['bs'] = _bs;
    return data;
  }
}
