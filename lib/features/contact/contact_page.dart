import 'package:flutter/material.dart';
import 'package:oceancomex_web/features/contact/infocontact_pagect.dart';
import 'package:oceancomex_web/features/contact/functions_pagecontact.dart';
import 'package:oceancomex_web/features/services/firestore_service.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:oceancomex_web/shared/widgets/main_header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Controladores y estado del formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _asuntoController = TextEditingController();
  final _mensajeController = TextEditingController();
  bool _isLoading = false;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _asuntoController.dispose();
    _mensajeController.dispose();
    super.dispose();
  }

Future<void> _enviarFormulario() async {
  if (_formKey.currentState!.validate()) {
    setState(() => _isLoading = true);

    try {
      // 1. Guardar en Firebase
      await _firestoreService.guardarContacto(
        nombreCompleto: _nombreController.text,
        email: _emailController.text,
        telefono: _telefonoController.text,
        asunto: _asuntoController.text,
        mensaje: _mensajeController.text,
      );

      // 2. Enviar notificación a Cloudflare Worker
      final workerUrl = "https://late-dust-160c.carlos-bohorquez-ortiz.workers.dev"; // 🔴 REEMPLAZA CON TU URL
      
      final response = await http.post(
        Uri.parse(workerUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'nombre': _nombreController.text,
          'email': _emailController.text,
          'telefono': _telefonoController.text,
          'asunto': _asuntoController.text,
          'mensaje': _mensajeController.text,
        }),
      );

      if (response.statusCode == 200) {
        print('✅ Email enviado a Cloudflare');
      } else {
        print('⚠️ Error Cloudflare: ${response.body}');
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Mensaje enviado con éxito! Te responderemos pronto.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
          ),
        );
        
        _formKey.currentState!.reset();
        _nombreController.clear();
        _emailController.clear();
        _telefonoController.clear();
        _asuntoController.clear();
        _mensajeController.clear();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al enviar: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainHeader(),
            
            /// HERO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: const Color(0xFF0A2A43),
              child: Column(
                children: const [
                  Text(
                    'Contáctanos',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Estamos aquí para ayudarte con tus necesidades logísticas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            /// SECCIÓN DE CONTACTO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: isMobile
                    ? Column(
                        children: [
                          buildContactInfo(),
                          const SizedBox(height: 40),
                          buildContactForm(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: buildContactInfo()),
                          const SizedBox(width: 50),
                          Expanded(child: buildContactForm()),
                        ],
                      ),
              ),
            ),

            const SizedBox(height: 60),

            /// MAPA
            buildMapSection(),

            const SizedBox(height: 60),

            const FooterSection()
          ],
        ),
      ),
    );
  }

  /// FORMULARIO DE CONTACTO
  Widget buildContactForm() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Envíanos un mensaje',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2A43),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 80,
              height: 4,
              color: const Color(0xFFFFDE59),
            ),
            const SizedBox(height: 30),

            // Nombre
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                hintText: 'Ingresa tu nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.person, color: Color(0xFF0A2A43)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu nombre';
                }
                if (value.trim().length < 3) {
                  return 'El nombre debe tener al menos 3 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'tucorreo@ejemplo.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.email, color: Color(0xFF0A2A43)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu correo';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Ingresa un correo electrónico válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Teléfono
            TextFormField(
              controller: _telefonoController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                hintText: '+593 959119599',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.phone, color: Color(0xFF0A2A43)),
                helperText: 'Opcional',
              ),
            ),
            const SizedBox(height: 20),

            // Asunto
            TextFormField(
              controller: _asuntoController,
              decoration: InputDecoration(
                labelText: 'Asunto',
                hintText: '¿Sobre qué quieres consultar?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.subject, color: Color(0xFF0A2A43)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa el asunto';
                }
                if (value.trim().length < 5) {
                  return 'El asunto debe tener al menos 5 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Mensaje
            TextFormField(
              controller: _mensajeController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Mensaje',
                hintText: 'Escribe tu mensaje aquí...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignLabelWithHint: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Icon(Icons.message, color: Color(0xFF0A2A43)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu mensaje';
                }
                if (value.trim().length < 10) {
                  return 'El mensaje debe tener al menos 10 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),

            // Botón de enviar
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFDE59),
                  foregroundColor: const Color(0xFF0A2A43),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                onPressed: _isLoading ? null : _enviarFormulario,
                child: _isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF0A2A43),
                        ),
                      )
                    : const Text(
                        'Enviar mensaje',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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