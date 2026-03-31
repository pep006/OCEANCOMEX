import 'package:flutter/material.dart';

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
                        "Nuestra Propuesta De Valor",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF083A52), // Color corporativo
                        ),
                      ),
                      const SizedBox(height: 20),
                        const SizedBox(height: 30),
                    
                    // Lista de características con viñetas
                    buildFeatureItem(
                      'Integración total',
                      'un solo punto de contacto para todas las gestiones operativas, documentales y logísticas.',
                    ),
                    buildFeatureItem(
                      'Experiencia sectorial',
                      'profundo conocimiento del marco regulatorio pesquero ecuatoriano e internacional.',
                    ),
                    buildFeatureItem(
                      'Transparencia y eficiencia',
                      'trazabilidad total de cada operación.',
                    ),
                    buildFeatureItem(
                      'Red estratégica',
                      'relaciones activas con autoridades, proveedores y flotas internacionales.',
                    ),
                    buildFeatureItem(
                      'Soluciones personalizadas',
                      'adaptadas a cada cliente, tipo de embarcación o flujo comercial.',
                    ),
                    buildFeatureItem(
                      'Relaciones institucionales y regulatorias',
                      'Representación técnica en inspecciones y auditorias oficiales por las autoridades de control, resolución de conflictos administrativos y gestiones de cumplimiento.',
                      isLast: true,
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



    Widget buildFeatureItem(String title, String description, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Viñeta decorativa
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFFFDE59),
              shape: BoxShape.circle,
            ),
          ),
          // Texto
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2A43),
                    ),
                  ),
                  TextSpan(
                    text: description,
                  ),
                ],
              ),
            ),
          ),
        ],
        
      ),
      
    );
    
  }
}