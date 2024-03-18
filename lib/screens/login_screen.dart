import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_login_with_rest_api/provider/login_auth_provider.dart';
import 'package:provider_login_with_rest_api/provider/toggle_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final toggleProvider = Provider.of<ToggleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter Your Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<ToggleProvider>(builder: (context, value, child) {
              return TextFormField(
                obscureText: toggleProvider.toggle,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  suffix: InkWell(
                      onTap: () {
                        toggleProvider.setToggle(!toggleProvider.toggle);
                      },
                      child: Icon(toggleProvider.toggle
                          ? Icons.visibility_off_outlined
                          : Icons.visibility)),
                ),
              );
            }),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                authProvider.login(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authProvider.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
