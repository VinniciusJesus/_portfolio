import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({required this.onScrollToContact, super.key});

  final VoidCallback onScrollToContact;

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _visible = false;

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_visible && info.visibleFraction > 0.3) {
      setState(() => _visible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 96),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child:
                isMobile
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildTextContent(isMobile: true),
                        const SizedBox(height: 32),
                        _buildImageCard(isMobile: true),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _buildTextContent(isMobile: false)),
                        const SizedBox(width: 92),
                        _buildImageCard(isMobile: false),
                      ],
                    ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent({required bool isMobile}) {
    final animate = _visible;

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Sobre Mim',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.chakraPetch(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ).animate(target: animate ? 1 : 0).fadeIn().slideY(begin: -0.2),
        const SizedBox(height: 24),
        Text(
          'Sou desenvolvedor de aplicativos com mais de 5 anos de experiência em Flutter, especializado em projetos mobile complexos e integrações via Bluetooth para Android e iOS. Iniciei minha jornada na programação em 2018 e, desde então, venho unindo criatividade e técnica para construir soluções robustas e modernas.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.inter(
            fontSize: 18,
            height: 1.6,
            color: Colors.black87,
          ),
        ).animate(target: animate ? 1 : 0).fadeIn(delay: 200.ms),
        const SizedBox(height: 16),
        Text(
          'Atuei em projetos onde tive autonomia para definir arquiteturas escaláveis e tomar decisões técnicas estratégicas, sempre com foco em performance, usabilidade e manutenção a longo prazo. Sou movido por desafios, tenho perfil ágil e colaborativo, e valorizo muito a clareza, eficiência e qualidade no código.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.inter(
            fontSize: 18,
            height: 1.6,
            color: Colors.black87,
          ),
        ).animate(target: animate ? 1 : 0).fadeIn(delay: 400.ms),
        const SizedBox(height: 16),
        Text(
          'Graduado em Análise e Desenvolvimento de Sistemas pela FATEC Ribeirão Preto, trago comigo a combinação entre fundamentos sólidos, curiosidade constante e paixão por resolver problemas com tecnologia.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.inter(
            fontSize: 18,
            height: 1.6,
            color: Colors.black87,
          ),
        ).animate(target: animate ? 1 : 0).fadeIn(delay: 600.ms),
        const SizedBox(height: 32),
        _buildContactButton(widget.onScrollToContact)
            .animate(target: animate ? 1 : 0)
            .fadeIn(delay: 800.ms)
            .slideY(begin: 0.2),
      ],
    );
  }

  Widget _buildContactButton(VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.pink[100],
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(4, 4)),
          ],
        ),
        child: Text(
          'Fale Comigo',
          style: GoogleFonts.chakraPetch(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard({required bool isMobile}) {
    final animate = _visible;

    return Transform.rotate(
      angle: -0.05,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF8F5),
          border: Border.all(color: Colors.black, width: 4),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(8, 8)),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: ClipRRect(
            child: Image.asset(
                  'assets/svg/eu.jpg',
                  width: isMobile ? 260 : 340,
                  height: isMobile ? 320 : 420,
                  fit: BoxFit.cover,
                )
                .animate(target: animate ? 1 : 0)
                .fadeIn(duration: 600.ms)
                .scale(begin: const Offset(0.9, 0.9)),
          ),
        ),
      ),
    );
  }
}
