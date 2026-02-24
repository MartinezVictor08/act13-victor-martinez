import 'package:flutter/material.dart';
import '../main.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: sharedAppBar(context),
      body: Column(
        children: [
          sharedSecondaryNav(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text('Registrarse', 
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF4D8B31))),
                  _regField('Nombre'),
                  _regField('Apellidos'),
                  _regField('Correo'),
                  Row(
                    children: [
                      Expanded(child: _regField('Fecha nacimiento')),
                      const SizedBox(width: 10),
                      Expanded(child: _regField('Sexo')),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 106, 219, 214),
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    child: const Text('Registrarse', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _regField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            decoration: const InputDecoration(
              filled: true, fillColor: Color(0xFFD9D9D9),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}