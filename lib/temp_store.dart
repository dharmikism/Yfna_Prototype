import 'dart:typed_data';

class Complaint {
  Uint8List image;
  String status;
  String? problem;
  String? department;

  Complaint({
    required this.image,
    this.status = 'Pending',
    this.problem,
    this.department,
  });
}

class TempStore {
  static final List<Complaint> complaints = [];
}
