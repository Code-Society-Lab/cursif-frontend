String graphQlUrl = "localhost:4000/api";

const String registerQuery = r'''
  mutation RegisterMutation($email: String!, $username: String!, $password: String!) {
    register (email: $email, username: $username, password: $password) {}
  }
''';

const String loginQuery = r'''
  mutation LoginMutation($email: String!, $password: String!) {
    login (email: $email, password: $password) {}
  }
''';
