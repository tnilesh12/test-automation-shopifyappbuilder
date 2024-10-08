import 'package:intl/intl.dart';

class DateTimeUtils {
  static getDateTime(String d) {
    DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(d);
    String dateTime = DateFormat('dd MMM yyyy hh:mm aa').format(date);
    return dateTime.toString();
  }

  static getDateAndTime(String d) {
    DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(d);
    String dateTime =
        DateFormat.yMd().format(date) + "  " + DateFormat.Hms().format(date);
    return dateTime.toString();
  }
  
  static getDate(String d) {
    DateTime date = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(d);
    String dateTime = DateFormat('MMM dd, yyyy').format(date);
    return dateTime.toString();
  }
}
