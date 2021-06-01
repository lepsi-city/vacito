import 'names.dart';
import 'v.dart';
class DgcV1 {
  V? v; //v
  String? dateOfBirth; //dob - YYYY-MM-DD
  Names? names; //nam
  String? version; //ver

  DgcV1({
    this.v,
    this.dateOfBirth,
    this.names,
    this.version,
  });

  factory DgcV1.fromMap(Map certificate) {
    print("Making DcgV1");
    return DgcV1(
      v: V.fromMap(certificate["v"][0]),
      dateOfBirth: certificate["dob"],
      names: Names.fromMap(certificate["nam"]),
      version: certificate["ver"]
    );
  }

  factory DgcV1.defaultValues() {
    return DgcV1();
  }

}