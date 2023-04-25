// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ders {
  final String ad;
  final double harfDegeri;
  final double krediDegeri;
  Ders({
    required this.ad,
    required this.harfDegeri,
    required this.krediDegeri,
  });

  @override
  String toString() {
    
    return "$ad $harfDegeri $krediDegeri";
  }
  
}
