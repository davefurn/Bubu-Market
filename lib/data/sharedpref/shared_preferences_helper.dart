import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._init();
  static final LocalStorage instance = LocalStorage._init();
  static SharedPreferences? _prefs;
  final String firstTime = 'firstTime';
  final String email = 'email';
  final String password = 'password';
  final String phone = 'phone';
  final String accesstoken = 'token';
  final String refreshtoken = 'rtoken';
  final String firstName = 'firstName';
  final String lastName = 'lastName';

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) {
      return _prefs!;
    }
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<bool> setFirstTime() async {
    var pref = await instance.prefs;
    return pref.setBool(firstTime, true);
  }

  Future<bool> getFirstTime() async {
    var pref = await instance.prefs;
    var isNotFirstTime = pref.getBool(firstTime) ?? false;
    if (isNotFirstTime) {
      return false;
    }
    await setFirstTime();
    return true;
  }

  Future<bool> setEmail(String value) async {
    var pref = await instance.prefs;
    return pref.setString(email, value);
  }

  Future<bool> setFirstName(String value) async {
    var pref = await instance.prefs;
    return pref.setString(firstName, value);
  }

  Future<bool> setLastName(String value) async {
    var pref = await instance.prefs;
    return pref.setString(lastName, value);
  }

  Future<String?> getFirstName() async {
    var pref = await instance.prefs;
    return pref.getString(firstName);
  }

  Future<String?> getLastName() async {
    var pref = await instance.prefs;
    return pref.getString(lastName);
  }

  Future<bool> setPassword(String value) async {
    var pref = await instance.prefs;
    return pref.setString(password, value);
  }

  Future<bool> setPhoneNumber(String value) async {
    var pref = await instance.prefs;
    return pref.setString(phone, value);
  }

  Future<String?> getPhone() async {
    var pref = await instance.prefs;
    return pref.getString(phone);
  }

  Future<String?> getPassword() async {
    var pref = await instance.prefs;
    return pref.getString(password);
  }

  Future<String?> getEmail() async {
    var pref = await instance.prefs;
    return pref.getString(email);
  }

  Future<bool> setAccessToken(String value) async {
    var pref = await instance.prefs;
    return pref.setString(accesstoken, value);
  }

  Future<String?> getAccessToken() async {
    var pref = await instance.prefs;
    return pref.getString(accesstoken);
  }

  Future<bool> setRefreshToken(String value) async {
    var pref = await instance.prefs;
    return pref.setString(refreshtoken, value);
  }

  Future<String?> getRefreshToken() async {
    var pref = await instance.prefs;
    return pref.getString(refreshtoken);
  }

  // Future<void> saveUserData(LoginData data) async {
  //   var pref = await instance.prefs;
  //   await pref.setString(accesstoken, data.token.accessToken);
  //   await pref.setString(refreshtoken, data.token.refreshToken);
  //   await pref.setString(firstName, data.firstName);
  //   await pref.setString(firstName, data.lastName);
  //   await pref.setString(email, data.email);
  // }

  // Future<LoginData> getUserData() async {
  //   var pref = await instance.prefs;
  //   var lastName_ = pref.getString(lastName)!;
  //   var firstName_ = pref.getString(firstName)!;
  //   var email_ = pref.getString(email)!;
  //   var phoneNumber_ = pref.getString(phone)!;
  //   var token_ = Token(refreshToken: refreshtoken, accessToken: accesstoken);

  //   return LoginData(
  //     email: email_,
  //     firstName: firstName_,
  //     token: token_,
  //     lastName: lastName_,
  //     phoneNumber: phoneNumber_,
  //   );
  // }
}
