import 'package:flutter/material.dart';
import 'registro/iniciar.dart';
import 'registro/registrarse.dart';
import 'registro/inicio.dart';

void main() {
  runApp(const SmileApp());
}

class SmileApp extends StatelessWidget {
  const SmileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home', // Cambiado a home para visualizar el diseño centrado
      routes: {
        '/login': (context) => const IniciarSesion(),
        '/registro': (context) => const RegistroScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

// --- WIDGETS REUTILIZABLES PARA TODAS LAS PÁGINAS ---

PreferredSizeWidget sharedAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 131, 255, 239),
    elevation: 1,
    automaticallyImplyLeading: false,
    title: Center( // Centramos el contenido interno del AppBar para Web
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000), // Ancho máximo del contenido
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  'https://raw.githubusercontent.com/MartinezVictor08/ima/refs/heads/main/di-removebg-preview.png',
                  width: 35,
                  height: 35,
                ),
                const SizedBox(width: 10),
                const Text('Smile- Victor Martinez 6J', 
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.black),
              onPressed: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget sharedSecondaryNav() {
  return Container(
    color: const Color.fromARGB(255, 97, 192, 192),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Center( // Esto centra la barra en pantallas anchas (Web)
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centra los items si hay espacio de sobra
            children: const [
              _TabItem(label: 'inicio'),
              _TabItem(label: 'Contacto'),
              _TabItem(label: 'Agendar cita'),
              _TabItem(label: 'historial'),
              _TabItem(label: 'Doctores'),
            ],
          ),
        ),
      ),
    ),
  );
}

class _TabItem extends StatelessWidget {
  final String label;
  const _TabItem({required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // Aumenté un poco el padding
      child: Text(label, 
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)
      ),
    );
  }
}

