import "dart:convert";

import "package:http/http.dart" as http;

String baseUrl = "localhost:4000";

Uri getQueryUrl({Map<String, dynamic>? queryParameters}) {
  return Uri.http(baseUrl, "/api", queryParameters);
}

Uri baseQuery = getQueryUrl();

Future<http.Response> postQuery(String query, Map variables) {
  return http.post(baseQuery,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"query": query, "variables": variables}));
}

const String registerQuery = r'''
  mutation RegisterMutation($email: String!, $username: String!, $password: String!) {
    register (email: $email, username: $username, password: $password) {}
  }
''';

Future<http.Response> registerUser(
    String email, String username, String password) {
  return postQuery(registerQuery,
      {"email": email, "username": username, "password": password});
}

const String loginQuery = r'''
  mutation LoginMutation($email: String!, $password: String!) {
    login (email: $email, password: $password) {}
  }
''';

Future<http.Response> loginUser(String email, String password) {
  return postQuery(registerQuery, {"email": email, "password": password});
}
