import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static final uidKey = "fkjdshkjsfdk";
  static final mKey = "jsdbkjekkbhfa";
  static final nKey = "kjfkldskdslkdfslk";
  static final pKey = "sdjkdsfkjdsfkj";
  static final lKey = "dsjkdsdsfkfl";
  static final rKey = "fsdjkfdslkds";
  static final AudKey = "fsdjkfsfsfddslkds";
  static final JokKey = "fsdjksdfsdfkds";
  static final F50Key = "fsafsafasafkds";
  static final ExpKey = "fsdjksfsdfweweds";

  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidKey);
  }

  static Future<bool> saveMoney(String money) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(mKey, money);
  }

  static Future<String?> getMoney() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(mKey);
  }

  static Future<bool> saveName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nKey, name);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nKey);
  }

  static Future<bool> saveUrl(String prourl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(pKey, prourl);
  }

  static Future<String?> getUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(pKey);
  }

  static Future<bool> saveLevel(String level) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(lKey, level);
  }

  static Future<String?> getLevel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(lKey);
  }

  static Future<bool> saveRank(String Rank) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(rKey, Rank);
  }

  static Future<String?> getRank() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rKey);
  }


  static Future<bool?> saveAud(bool IsAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(AudKey, IsAvail);
  }
  static Future<bool?> getAud() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(AudKey);
  }

  static Future<bool?> saveJoker(bool IsAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(JokKey, IsAvail);
  }
  static Future<bool?> getJoker() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(JokKey);
  }

  static Future<bool?> save50(bool IsAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(F50Key, IsAvail);
  }
  static Future<bool?> get50() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(F50Key);
  }

  static Future<bool?> saveExp(bool IsAvail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(ExpKey, IsAvail);
  }
  static Future<bool?> getExp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(ExpKey);
  }




  static Future<void> clearAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(uidKey);
    await preferences.remove(mKey);
    await preferences.remove(nKey);
    await preferences.remove(pKey);
    await preferences.remove(lKey);
    await preferences.remove(rKey);
  }
}
