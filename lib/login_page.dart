import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  // Parámetros de login y contraseña
  final String _validUsername = 'admin';
  final String _validPassword = 'admin';

  void _validateCredentials() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == _validUsername && password == _validPassword) {
      // Si las credenciales son válidas, redirige a la pantalla nueva
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessPage(),
        ),
      );
    } else {
      // Si las credenciales son inválidas, muestra el mensaje de error
      setState(() {
        _errorMessage = 'Credenciales inválidas';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Login', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage != null) // Mostrar el mensaje de error si existe
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red,
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            const SizedBox(height: 30),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/5087/5087579.png',
              height: 150,
            ),
            const SizedBox(height: 30),
            const Text(
              "Digite los datos de acceso en los campos de abajo",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            CupertinoTextField(
              controller: _usernameController,
              cursorColor: Colors.pinkAccent,
              padding: EdgeInsets.all(15),
              placeholder: "Usuario",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 5),
            CupertinoTextField(
              controller: _passwordController,
              cursorColor: Colors.pinkAccent,
              padding: EdgeInsets.all(15),
              placeholder: "Contraseña",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                padding: const EdgeInsets.all(17),
                color: Colors.greenAccent,
                child: const Text(
                  "Accesar",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: _validateCredentials,
              ),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Esto permite que el contenido de la página se extienda detrás de la AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Hace que el fondo de la AppBar sea transparente
        elevation: 0, // Elimina la sombra de la AppBar
        title: Text('', style: TextStyle(color: Colors.white)), // Asegúrate de que el texto sea visible
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí va el contenido de tu página de éxito
            const Text(
              "Bienvenido!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Agrega más widgets aquí según sea necesario
          ],
        ),
      ),
    );
  }
}
