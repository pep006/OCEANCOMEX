import 'package:flutter/material.dart';
import 'package:oceancomex_web/shared/widgets/footer_section.dart';

class PropuestaSection extends StatelessWidget {
  const PropuestaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Row(
              children: [
                // Texto a la izquierda
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "NUESTRA PROPUESTA DE VALOR",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF083A52), // Color corporativo
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
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Imagen a la derecha (SIN FONDO)
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 400,
                    margin: const EdgeInsets.only(left: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Bordes suaves (opcional)
                      child: Image.asset(
                        'assets/images/grafico_propuesta_valor.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Imagen no encontrada',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
              
            ),
          ),
        ),
      
      ],
    );
          

  }
}