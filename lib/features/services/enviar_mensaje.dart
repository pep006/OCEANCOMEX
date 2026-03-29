import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> enviarMensaje({
  required String nombre,
  required String correo,
  required String telefono,
  required String asunto,
  required String mensaje,
}) async {
  await FirebaseFirestore.instance.collection('mensajes').add({
    'nombre': nombre,
    'correo': correo,
    'telefono': telefono,
    'asunto': asunto,
    'mensaje': mensaje,
    'fecha': FieldValue.serverTimestamp(),
  });
}