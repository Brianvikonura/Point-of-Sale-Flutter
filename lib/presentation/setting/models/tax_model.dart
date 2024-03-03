enum TaxType {
  layanan,
  pajak;

  bool get isLayanan => this == TaxType.layanan;
  bool get isPajak => this == TaxType.pajak;
}

class TaxModel {
  final String name;
  final TaxType type;
  final int value;

  TaxModel({
    required this.name,
    required this.type,
    required this.value,
  });
}
