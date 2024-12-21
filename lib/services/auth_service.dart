class AuthService {
  static String? _email;
  static String? _password;


  static void setEmail(String email) {
    _email = email;
  }

  static void setPassword(String password) {
    _password = password;
  }

  static bool validateLogin(String email, String password) {
    return email =='nada.zanoun@ensia.edu.dz' && password == 'nadazanoun';
  }
}
