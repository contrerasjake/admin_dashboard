class ApiUrls {
  static const baseUrl = 'https://svc.devsolutions.sds.dev/';
  static const signin = 'api/auth/signin';
  static const forgetPass = 'api/auth/forgot/password';
  static const users = 'api/users';
  static String userInfo(int id) {
    return 'api/users/$id';
  }
}
