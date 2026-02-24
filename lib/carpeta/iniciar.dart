import 'package:flutter/material.dart';
import '../main.dart'; // Importante para usar sharedAppBar y sharedSecondaryNav

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({super.key});

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
                  const Text('Iniciar Sesión', 
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF4D8B31))),
                  const SizedBox(height: 40),
                  _buildInput('Gmail'),
                  const SizedBox(height: 20),
                  _buildInput('Contraseña', obscure: true),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 109, 219, 201),
                      side: const BorderSide(color: Colors.black),
                      minimumSize: const Size(200, 50),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    child: const Text('Iniciar Sesión', style: TextStyle(color: Colors.black)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/registro'),
                    child: const Text('No tienes cuenta? Registrarse', 
                      style: TextStyle(color: Colors.black, decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String label, {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscure,
          decoration: const InputDecoration(
            filled: true, fillColor: Color(0xFFD9D9D9),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}