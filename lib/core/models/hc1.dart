import 'dgc_v1.dart';

class Hc1 {
  String? issuer; //claim key 1
  int? issuedAt; //claim key 6
  int? expirationTime; //claim key 4
  DgcV1? certificate; //claim key -260 [1]

  Hc1({this.issuer, this.issuedAt, this.expirationTime, this.certificate});

  factory Hc1.defaultValues() {
    return Hc1();
  }

  factory Hc1.fromMap(Map data) {
    print("Making Hc1");
    return Hc1(
      issuer: data[1],
      issuedAt: data[6],
      expirationTime: data[4],
      certificate: DgcV1.fromMap(data[-260][1]),
    );
  }
}
