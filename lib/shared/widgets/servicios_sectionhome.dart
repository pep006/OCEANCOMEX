import 'package:flutter/material.dart';

class ServiciosSection extends StatelessWidget {
  const ServiciosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título principal
          const Text(
            "Servicios",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color(0xFF083A52),
            ),
          ),
          const SizedBox(height: 40),

          // Grid de servicios
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Columna izquierda
              Expanded(
                child: Column(
                  children: [
                  
                     
                    _buildServiceCard(
                      title: "SECTOR PROCUREMENT",
                      description:
                          "•	Búsqueda de proveedores, Solicitud de cotizaciones, Verificación de proveedores, Asistencia en compras ",
                      icon: Icons.handshake,
                    ),
                    const SizedBox(height: 20),
                    _buildServiceCard(
                      title: "SECTOR COMERCIO EXTERIOR",
                      description:
                          "• Gestión completa de procesos aduaneros, Coordinación logística marítima, aérea y terrestre, Emisión, validación y legalización de documentos internacionales (BL, COO, factura comercial, packing list, etc.)",
                      icon: Icons.directions_boat_filled,
                      isCompact: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // Columna derecha
              Expanded(
                child: Column(
                  children: [
                     _buildServiceCard(
                      title: "SECTOR PESCA",
                      description:
                          "Trámites de asociación \"Manejo Documental Pesquero para plantas o comercializadoras\"",
                      icon: Icons.set_meal,
                    ),
                    const SizedBox(height: 20),
                    _buildServiceCard(
                      title: "GESTIÓN ADUANERA",
                      description:
                          "• Asesoría en gestión aduanera, regímenes aduaneros especiales (ZEDES, Admisión Temporal, Depósitos Aduaneros otros regímenes de importación y exportación).",
                          
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
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 5),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: const Color(0xFF083A52).withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icono y título
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF083A52).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF083A52), size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isCompact ? 20 : 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF083A52),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Descripción
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),

          // Botón "Ver más" (opcional)
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Ver más",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF083A52),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward,
                size: 16,
                color: const Color(0xFF083A52),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
