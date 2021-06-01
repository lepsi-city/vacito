class Names {
  String? foreName; //fn
  String? givenName; //gn
  String? foreNameT; //fnt
  String? givenNameT; //gnt

  Names({
    this.foreName,
    this.givenName,
    this.foreNameT,
    this.givenNameT,
  });

  factory Names.fromMap(Map names) {
    print("Making names");
    return Names(
        foreName: names["fn"],
        givenName: names["gn"],
        foreNameT: names["fnt"],
        givenNameT: names["gnt"],
    );
  }

  factory Names.defaultValues() {
    return Names();
  }

}