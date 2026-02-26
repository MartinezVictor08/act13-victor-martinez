import 'package:flutter/material.dart';

// --- WIDGETS REUTILIZABLES ---

PreferredSizeWidget sharedAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 131, 255, 239),
    elevation: 1,
    automaticallyImplyLeading: false,
    title: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
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
                const Text(
                  'Smile- Victor Martinez 6J',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }
}

// --- PANTALLA DE INICIO ---

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: sharedAppBar(context),
      body: Column(
        children: [
          sharedSecondaryNav(),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dentista Juarez',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Elige entre los mejores dentistas de Cd. Juarez, especialistas en distintos tratamientos dentales. Desde odontología general hasta procedimiento de estética dental.',
                        style: TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
                      ),
                      const SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://raw.githubusercontent.com/MartinezVictor08/ima/refs/heads/main/d.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Row(
                        children: [
                          Expanded(child: _actionButton('Ver ubicación')),
                          const SizedBox(width: 20),
                          Expanded(child: _actionButton('Agendar Cita')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF1A3A5F), width: 2),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF1A3A5F), fontWeight: FontWeight.bold),
      ),
    );
  }
}