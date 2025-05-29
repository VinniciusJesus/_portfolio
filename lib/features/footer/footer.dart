import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe3dff2),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text(
          '© ${DateTime.now().year} Marcos • Desenvolvido com Flutter',
          style: GoogleFonts.chakraPetch(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
