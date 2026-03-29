import 'package:flutter/material.dart';

class PresentationSection extends StatelessWidget {
  const PresentationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Row(
          children: [
            // Imagen a la izquierda (SIN FONDO)
            Expanded(
              flex: 4,
              child: Container(
                height: 400,
                margin: const EdgeInsets.only(right: 30),
                child: Image.asset(
                  'assets/images/presentation_image.png',
                  fit: BoxFit.contain, // contain para que no se recorte
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text('Imagen no encontrada'),
                    );
                  },
                ),
              ),
            ),
            
            // Texto a la derecha
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PRESENTACIÓN CORPORATIVA",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "OCEANCOMEX es un operador integral en logística y comercio exterior, "
                    "especializado en servicios de transporte multimodal (FCL, LCL, aéreo y terrestre) "
                    "para importación y exportación. Actuamos como freight forwarder, ofreciendo "
                    "agenciamiento y consolidación de carga, así como todos los servicios asociados "
                    "a la cadena logística.\n\n"
                    "Nuestro equipo se distingue por brindar atención personalizada en cada operación, "
                    "garantizando una ejecución ágil y la trazabilidad completa de la carga. Contamos "
                    "con el respaldo de una red internacional, lo que nos permite asegurar cumplimiento "
                    "de plazos y ofrecer tiempos de entrega confiables",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}