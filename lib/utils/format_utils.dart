import 'package:intl/intl.dart';

class Formats {
 static Formats instance = Formats._init();
  Formats._init();

  final dateFormat = DateFormat('dd/MM/yyyy');
}