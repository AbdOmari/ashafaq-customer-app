import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});
  static const String id = "HomeTabScreen";

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: isArabic
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Para árabe, intercambiar completamente el switch y las notificaciones (no solo invertir)
                children: isArabic
                    ? [
                        // Contenedor con switch de conexión - Ajustado para RTL
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1E51),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              // En RTL, el círculo del switch debe estar a la izquierda cuando está apagado
                              Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  value: false,
                                  onChanged: (_) {},
                                  activeColor: Colors.white,
                                  activeTrackColor: Colors.transparent,
                                ),
                              ),
                              Text(
                                "home.offline".tr(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        // Logo central
                        Image.asset(
                          'assets/images/ashafaq_logo.png',
                          width: 90,
                          height: 40,
                        ),
                        // Icono de notificaciones con indicador
                        Stack(
                          children: [
                            const Icon(Icons.notifications_none_outlined),
                            Positioned(
                              top: 0,
                              // Posicionar a la izquierda en RTL
                              left: 0,
                              child: const CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ]
                    : [
                        // Contenedor con switch de conexión
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1E51),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "home.offline".tr(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              Switch(
                                value: true,
                                onChanged: (_) {},
                                activeColor: Colors.white,
                                activeTrackColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        // Logo central
                        Image.asset(
                          'assets/images/ashafaq_logo.png',
                          width: 90,
                          height: 40,
                        ),
                        // Icono de notificaciones con indicador
                        Stack(
                          children: [
                            const Icon(Icons.notifications_none_outlined),
                            Positioned(
                              top: 0,
                              // Posicionar a la derecha en LTR
                              right: 0,
                              child: const CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
              ),
              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                child: isArabic
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "home.today_orders".tr(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: isArabic
                                ? TextAlign.right
                                : TextAlign.left,
                          ),

                          Text(
                            "home.see_all".tr(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1A1E51),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "home.see_all".tr(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1A1E51),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            "home.day_requests".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 40),

              Center(
                child: Text(
                  "home.no_requests".tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
