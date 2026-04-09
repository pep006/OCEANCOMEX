// lib/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<String> guardarContacto({
    required String nombreCompleto,
    required String email,
    required String telefono,
    required String asunto,
    required String mensaje,
  }) async {
    try {
      Map<String, dynamic> datosContacto = {
        'nombreCompleto': nombreCompleto.trim(),
        'email': email.trim().toLowerCase(),
        'telefono': telefono.trim(),
        'asunto': asunto.trim(),
        'mensaje': mensaje.trim(),
        'fecha': FieldValue.serverTimestamp(),
        'estado': 'pendiente',
        'leido': false,
      };

      DocumentReference docRef = await _firestore
          .collection('contactos')
          .add(datosContacto);

      debugPrint('Documento guardado con ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      debugPrint('Error detallado: $e');
      throw Exception('Error al guardar contacto: $e');
    }
  }
}