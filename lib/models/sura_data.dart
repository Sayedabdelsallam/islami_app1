class SuraData {
  final String suraNumber;
  final String suraNameEn;
  final String suraNameAr;
  final String verses;

  SuraData({required this.suraNumber,required this.suraNameEn,required this.suraNameAr,required this.verses});
  @override
  String toString() {
    return 'SuraData(suraNumber: $suraNumber, suraNameEn: $suraNameEn, suraNameAr: $suraNameAr, verses: $verses)';
  }
}

