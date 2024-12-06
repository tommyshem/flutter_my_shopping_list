import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser {
  CurrentUser();

  String email = "";
  bool isLoggedIn = false;
  String password = "";
  String userName = "";
  String userImagePath = "";

// get sharedPreferences if they are saved already
  Future<bool> getLogInPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String userId = sharedPreferences.getString('userName') ?? "";
    final String emailId = sharedPreferences.getString("email") ?? "";
    final String passwordId = sharedPreferences.getString("password") ?? "";
    final String userImage = sharedPreferences.getString("userImagePath") ?? "";
    if (userName != "") {
      isLoggedIn = true;
      userName = userId;
      email = emailId;
      password = passwordId;
      userImagePath = userImage;
      return true;
    }
    return false;
  }

// save current user to shared preferences
  Future<void> saveLogInPreferences(name, email, password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('userName', name);
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("password", password);
    sharedPreferences.setString("userImagePath", userImagePath);
  }

  String getPassword() {
    return password;
  }

  String getNUserName() {
    return userName;
  }

  String getEmail() {
    return email;
  }
}
