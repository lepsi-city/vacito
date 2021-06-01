class V {
  String? ci; //ci
  String? co; //co
  String? dn; //dn
  String? dt; //dt
  String? isss; //is
  String? ma; //ma
  String? mp; //mp
  String? sd; //sd
  String? tg; //tg
  String? vp; //vp

  V({
    this.ci,
    this.co,
    this.dn,
    this.dt,
    this.isss,
    this.ma,
    this.mp,
    this.sd,
    this.tg,
    this.vp,
  });

  factory V.fromMap(Map v) {
    return V(
      ci: v["ci"],
      co: v["co"],
      dn: v["dn"],
      dt: v["dt"],
      isss: v["is"],
      ma: v["ma"],
      mp: v["mp"],
      sd: v["sd"],
      tg: v["tg"],
      vp: v["vp"],
    );
  }

  factory V.defaultValues() {
    return V();
  }

}