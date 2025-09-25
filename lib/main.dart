import 'package:flutter/material.dart';

import 'login_screens/splash_screen.dart';      // Import OK, class di file ini adalah SplashPage
import 'login_screens/login_page.dart';        // LoginPage dengan OOP (onAuthSuccess)
import 'login_screens/register_page.dart';     
import 'login_screens/forgot_password.dart';   
import 'login_screens/home_page.dart';         

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CamHealth App',  
      debugShowCheckedModeBanner: false,  
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),  // Fix: Ganti ke SplashPage() (cocok dengan class di splash_screen.dart) + tambah const
        '/login': (context) => const LoginPageWrapper(),  // Tambah const untuk optimasi
        '/register': (context) => const RegisterPage(),  // Tambah const
        '/forgot_password': (context) => const ForgotPasswordPage(),  // Tambah const
        '/home': (context) => HomePage(onLogout: () {}),  // OK, tambah const jika HomePage support
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginPageWrapper(),  // Tambah const
          settings: settings,
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'Route tidak ditemukan: ${settings.name}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          settings: settings,
        );
      },
    );
  }
}

class LoginPageWrapper extends StatefulWidget {
  const LoginPageWrapper({super.key});

  @override
  State<LoginPageWrapper> createState() => _LoginPageWrapperState();
}

class _LoginPageWrapperState extends State<LoginPageWrapper> {
  bool _isLoggedIn = false;

  void _onLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _onLogout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return HomePage(onLogout: _onLogout);
    } else {
      return LoginPage(onAuthSuccess: _onLoginSuccess);  // Kompatibel dengan OOP (onAuthSuccess dari BaseAuthPage)
    }
  }
}