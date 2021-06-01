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
    return DgcV1(
      v: certificate["v"],
      dateOfBirth: certificate["dob"],
      names: certificate["nam"],
      version: certificate["ver"]
    );
  }

  factory DgcV1.defaultValues() {
    return DgcV1();
  }

}