import 'package:flutter/material.dart';
import 'package:oceancomex_web/features/services/Services_pesca.dart';
import 'package:oceancomex_web/features/services/services_aduanera.dart';
import 'package:oceancomex_web/features/services/services_comext.dart';
import 'package:oceancomex_web/features/services/services_procurement.dart';

class ServiciosSection extends StatelessWidget {
  const ServiciosSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60, // 🔥 menos padding en móvil
        vertical: 50,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔵 TÍTULO
          Text(
            "Servicios",
            style: TextStyle(
              fontSize: isMobile ? 28 : 42, // 🔥 más pequeño en móvil
              fontWeight: FontWeight.bold,
              color: const Color(0xFF083A52),
            ),
          ),
          const SizedBox(height: 40),

          /// 🔥 CONTENIDO RESPONSIVE
          isMobile
              ? Column(
                  children: [
                    _buildServiceCard(
                      title: "Sector Procurement",
                      description:
                          "• Búsqueda de proveedores, Solicitud de cotizaciones, Verificación de proveedores, Asistencia en compras",
                      icon: Icons.handshake,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesProcurement(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildServiceCard(
                      title: "Sector Comercio Exterior",
                      description:
                          "• Gestión completa de procesos aduaneros, Coordinación logística marítima, aérea y terrestre, Emisión de documentos internacionales.",
                      icon: Icons.directions_boat_filled,
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesComext(),
                          ),
                        );
                      },
                      isCompact: true,

                    ),
                    const SizedBox(height: 20),
                    _buildServiceCard(
                      title: "Sector Pesca",
                      description:
                          "Trámites de asociación y manejo documental pesquero.",
                      icon: Icons.set_meal,
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesPesca(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildServiceCard(
                      title: "Gestión Aduanera",
                      description:
                          "• Asesoría en gestión aduanera y regímenes especiales.",
                      icon: Icons.handshake,
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesAduanera(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Columna izquierda
                    Expanded(
                      child: Column(
                        children: [
                          _buildServiceCard(
                            title: "Sector Procurement",
                            description:
                                "• Búsqueda de proveedores, Solicitud de cotizaciones, Verificación de proveedores, Asistencia en compras",
                            icon: Icons.handshake,
                          ),
                          const SizedBox(height: 20),
                          _buildServiceCard(
                            title: "Sector Comercio Exterior",
                            description:
                                "• Gestión completa de procesos aduaneros, Coordinación logística marítima, aérea y terrestre, Emisión de documentos internacionales.",
                            icon: Icons.directions_boat_filled,
                            isCompact: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 20),

                    /// Columna derecha
                    Expanded(
                      child: Column(
                        children: [
                          _buildServiceCard(
                            title: "Sector Pesca",
                            description:
                                "Trámites de asociación y manejo documental pesquero.",
                            icon: Icons.set_meal,
                          ),
                          const SizedBox(height: 20),
                          _buildServiceCard(
                            title: "Gestión Aduanera",
                            description:
                                "• Asesoría en gestión aduanera y regímenes especiales.",
                            icon: Icons.handshake,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String description,
    required IconData icon,
    bool isCompact = false,
    VoidCallback? onTap,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // 🔥 mejor práctica
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: const Color(0xFF083A52).withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icono + título
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF083A52).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF083A52), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isCompact ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF083A52),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Descripción
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 12),

          /// Botón
         /* InkWell(
            onTap: onTap, // 👈 acción
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Ver más",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF083A52),
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, size: 16, color: Color(0xFF083A52)),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
