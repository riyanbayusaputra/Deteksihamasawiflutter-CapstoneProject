import 'package:coba/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';

class LoginViews extends StatelessWidget {
  const LoginViews({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade400, Colors.green.shade300],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _JudulFormLogin(),
              _LogoAplikasi(),
              _FormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              label: 'Username',
            ),
            InputField(
              label: 'Password',
              obscure: true,
            ),
            SizedBox(height: 20),
            _TombolLogin(),
          ],
        ),
      ),
    );
  }
}

class _TombolLogin extends StatelessWidget {
  const _TombolLogin({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => DashboardView()),
        );
      },
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final bool obscure;
  const InputField({
    Key? key,
    required this.label,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: obscure,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class _LogoAplikasi extends StatelessWidget {
  const _LogoAplikasi({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Image.asset(
        'assets/sawi.png',
        width: 150,
      ),
    );
  }
}

class _JudulFormLogin extends StatelessWidget {
  const _JudulFormLogin({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            'APLIKASI DETEKSI',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'HAMA TANAMAN SAWI',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
