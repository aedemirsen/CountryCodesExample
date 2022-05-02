class Country {
  String? id;
  String? name;
  String? nativeName;
  int? phoneCode;
  String? continent;
  String? capital;
  String? currency;
  List<String>? languages;

  Country(
      {this.id,
      this.name,
      this.nativeName,
      this.phoneCode,
      this.continent,
      this.capital,
      this.currency,
      this.languages});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nativeName = json['nativeName'];
    phoneCode = json['phoneCode'];
    continent = json['continent'];
    capital = json['capital'];
    currency = json['currency'];
    languages = json['languages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nativeName'] = nativeName;
    data['phoneCode'] = phoneCode;
    data['continent'] = continent;
    data['capital'] = capital;
    data['currency'] = currency;
    data['languages'] = languages;
    return data;
  }
}
