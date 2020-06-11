class Country {
  Country({this.country, this.flag, this.code});

  String country;

  String flag;
  String code;

  static List<Country> loadLocations() {
    return [
      Country(code: 'GH', country: 'Ghana', flag: 'assets/ghana.png'),
      Country(
          code: 'America/Detroit', country: 'Detroit', flag: 'assets/usa.png'),
    ];
  }
}
