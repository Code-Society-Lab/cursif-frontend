import 'package:cursif/api/auth.dart';
import 'package:cursif/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(graphQlUrl);

  final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())));

  runApp(GraphQLProvider(client: client, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: const Color(0xFFD7263D), fontFamily: "Lato"),
        home: const LoginScreen());
  }
}
