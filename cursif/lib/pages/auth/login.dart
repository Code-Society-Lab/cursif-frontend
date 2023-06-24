import 'package:cursif/api/auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const Column(
          children: [
            SizedBox(
                height: 100, width: double.infinity, child: LoginDecoration()),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 120, 40, 40),
                    child: LoginForm())),
          ],
        );
      } else {
        return const Row(children: [
          Expanded(
              flex: 3,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 40, 40, 40),
                  child: LoginForm())),
          Expanded(
              flex: 2,
              child:
                  SizedBox(height: double.infinity, child: LoginDecoration())),
        ]);
      }
    }));
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Cursif",
      style: TextStyle(fontFamily: "Pacifico", fontSize: 44),
    );
  }
}

class LoginDecoration extends StatelessWidget {
  const LoginDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor));
  }
}

class LoginField extends StatelessWidget {
  const LoginField({super.key, required this.onChanged, required this.label});

  final ValueChanged<String> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: TextField(
          decoration: InputDecoration(hintText: label),
          onChanged: onChanged,
        ));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.email, this.password});

  final String? email;
  final String? password;

  onValidPressed(runMutation) {
    runMutation({'email': email, 'password': password});
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(document: gql(loginQuery)),
        builder: (runMutation, result) {
          VoidCallback? onPressed;

          if (email != null && password != null) {
            onPressed = () {
              runMutation({"email": email, "password": password});
            };
          }

          return ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Theme.of(context).primaryColor)),
              onPressed: onPressed,
              child: const Text("Sign in"));
        });
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? email;
  String? password;

  handleChangeEmail(value) {
    setState(() {
      email = value;
    });
  }

  handleChangePassword(value) {
    setState(() {
      password = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Title(),
          const SizedBox(height: 80),
          const Text("Please sign in."),
          const SizedBox(height: 40),
          LoginField(onChanged: handleChangeEmail, label: "Email"),
          LoginField(onChanged: handleChangePassword, label: "Password"),
          const SizedBox(height: 30),
          LoginButton(
            email: email,
            password: password,
          )
        ]);
  }
}
