class Names {
  String? familyName; //fn
  String? givenName; //gn
  String? familyNameT; //fnt
  String? givenNameT; //gnt

  Names({
    this.familyName,
    this.givenName,
    this.familyNameT,
    this.givenNameT,
  });

  factory Names.fromMap(Map names) {
    print("Making names");
    return Names(
        familyName: names["fn"],
        givenName: names["gn"],
        familyNameT: names["fnt"],
        givenNameT: names["gnt"],
    );
  }

  factory Names.defaultValues() {
    return Names();
  }

}