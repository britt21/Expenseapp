import 'package:get_storage/get_storage.dart';

var db = GetStorage();
var OTPVERIFY = "OTP_VERIFY";
var UID = "UID";
var UPHONE = "UPHONE";
var isLoggedin = "ISLOGGEDIN";
var NAME = "NAME";
var EMAIL = "EMAIL";
var PHONE = "PHONE";


var CITY = "CITY";
var POSTALCODE = "POSTALCODE";
var STATE = "STATE";
var STREET = "STREET";
var COUNTRY = "COUNTRY";
var SCHEDULEDATE = "SCHEDULEDATE";
var SCHEDULETIME = "SCHEDULETIME";
var PACKAGE = "PACKAGE";
var CARMODEL = "CARMODEL";
var CARYEAR = "CARYEAR";
var VEHICLETYPE = "VEHICLETYPE";
var VEHICLEMODEL = "VEHICLETYPE";
var VEHICLEYEAR = "VEHICLEYEAR";
var VEHICLENUMBER = "VEHICLENUMBER";
var SELDATE = "SELDATE";
var SELTIME = "SELTIME";
var PRICE = "PRICE";
var SELMERCHANTNAME = "SELMERCHANTNAME";
var SELMERCHANTID = "SELMERCHANTID";
var SELMERCHANTADDRESS = "SELMERCHANTADDRESS";




saveKey(key, value) {
  db.write(key, value);
  print("SAVINGDATA: " + key);

}

String readKey(key) {
  var data = db.read(key);
  return data;
}
