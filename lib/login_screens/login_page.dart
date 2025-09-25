import 'package:flutter/material.dart';
import 'dart:math';
import 'forgot_password.dart';
import 'register_page.dart';

abstract class BaseAuthPage extends StatefulWidget {
  final VoidCallback? onAuthSuccess;

  const BaseAuthPage({Key? key, this.onAuthSuccess}) : super(key: key);

  @override
  State<BaseAuthPage> createState();
}

class LoginPage extends BaseAuthPage {
  const LoginPage({Key? key, super.onAuthSuccess}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _LoginController _controller = _LoginController();
  @override
  void initState() {
    super.initState();

    _controller.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleAuthSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login berhasil!'),
        backgroundColor: Colors.green,
      ),
    );

    widget.onAuthSuccess?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF2196F3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Care About Mental Health',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/logo.jpg',
                      height: 120,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.login,
                          size: 120,
                          color: Colors.white,
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    TextFormField(
                      controller: _controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: _controller.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _controller.passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _controller.obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _controller.toggleObscure();
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                      obscureText: _controller.obscurePassword,
                      validator: _controller.validatePassword,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_controller.validateForm(context)) {
                            // Validasi encapsulated
                            handleAuthSuccess(
                              context,
                            ); // Polymorphism: Panggil method di State
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue.shade400,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/forgot_password'),
                      child: const Text(
                        "Lupa Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: const Text(
                        "Belum punya akun? Daftar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginController {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get obscurePassword => _obscurePassword;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');
    if (!emailRegex.hasMatch(value)) return 'Masukkan email yang valid';
    return null;
  }

  String? validatePassword(String? value) =>
      value == null || value.isEmpty ? 'Password tidak boleh kosong' : null;

  bool validateForm(BuildContext context) => _formKey.currentState!.validate();

  void toggleObscure() => _obscurePassword = !_obscurePassword;

  void init() {}

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }
}
