import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/animated_postit_sticker.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({required this.onScrollToProjects, super.key});

  final VoidCallback onScrollToProjects;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      color: const Color(0xFF69d2e7),
      child: Stack(
        children: [
          ..._buildStickers(context),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(
                  isMobile,
                ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.3).then(),
                const SizedBox(height: 24),
                _buildSubtitle(
                  isMobile,
                ).animate().fadeIn(delay: 300.ms).slideY(begin: -0.2),
                const SizedBox(height: 32),
                _buildPortfolioButton(
                  isMobile,
                  onScrollToProjects,
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    size: 28,
                    color: Colors.black,
                  ),
                )
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .moveY(begin: 0, end: 10, duration: 800.ms),
          ),
        ],
      ),
    );
  }

  // _buildTitle, _buildSubtitle, _buildPortfolioButton, _buildStickers igual
}

Widget _buildTitle(bool isMobile) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black, width: 4),
      boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(6, 6))],
    ),
    child: Text(
      'OLÁ, EU SOU O MARCOS',
      textAlign: TextAlign.center,
      style: GoogleFonts.chakraPetch(
        textStyle: TextStyle(
          fontSize: isMobile ? 24 : 40,
          fontWeight: FontWeight.w900,
          color: Colors.black,
          letterSpacing: 2,
        ),
      ),
    ),
  ).animate().slideY(begin: -0.2).fadeIn();
}

Widget _buildSubtitle(bool isMobile) {
  return Text(
    'DEV FLUTTER • AUTOMAÇÕES COM IA',
    textAlign: TextAlign.center,
    style: GoogleFonts.chakraPetch(
      textStyle: TextStyle(
        fontSize: isMobile ? 18 : 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        letterSpacing: 2,
      ),
    ),
  ).animate().fadeIn(delay: 300.ms);
}

Widget _buildPortfolioButton(bool isMobile, VoidCallback scrollToProjects) {
  return PortfolioButton(isMobile: isMobile, onPressed: scrollToProjects);
}

class PortfolioButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isMobile;

  const PortfolioButton({
    required this.onPressed,
    required this.isMobile,
    super.key,
  });

  @override
  State<PortfolioButton> createState() => _PortfolioButtonState();
}

class _PortfolioButtonState extends State<PortfolioButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() async {
    await _controller.reverse();
    await _controller.forward();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: const [
              BoxShadow(color: Colors.black, offset: Offset(4, 4)),
            ],
          ),
          child: Text(
            'VER PORTFÓLIO',
            style: GoogleFonts.chakraPetch(
              textStyle: TextStyle(
                fontSize: widget.isMobile ? 14 : 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildStickers(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return [
    AnimatedPostItSticker(
      baseTop: 20,
      baseLeft: -30,
      size: 120,
      color: const Color(0xFFD1C4E9),
      drift: Tween(begin: Offset(-10, -6), end: Offset(10, 6)),
      angle: -0.2,
    ),
    AnimatedPostItSticker(
      baseTop: 220,
      baseLeft: 360,
      size: 280,
      color: const Color(0xFFFFF59D),
      drift: Tween(begin: Offset(12, -4), end: Offset(-12, 4)),
      angle: 0.1,
    ),
    AnimatedPostItSticker(
      baseTop: 100,
      baseLeft: size.width - 170,
      size: 120,
      color: const Color(0xFFB2EBF2),
      drift: Tween(begin: Offset(-6, 10), end: Offset(6, -10)),
      angle: -0.05,
    ),
    AnimatedPostItSticker(
      baseTop: size.height - 160,
      baseLeft: 130,
      size: 125,
      color: const Color(0xFFFFCCBC),
      drift: Tween(begin: Offset(5, 5), end: Offset(-5, -5)),
      angle: 0.15,
    ),
    AnimatedPostItSticker(
      baseTop: size.height - 580,
      baseLeft: 130,
      size: 145,
      color: const Color(0xFFC5E1A5),
      drift: Tween(begin: Offset(-8, 3), end: Offset(8, -3)),
      angle: -0.1,
    ),
    AnimatedPostItSticker(
      baseTop: 250,
      baseLeft: size.width - 350,
      size: 260,
      color: const Color(0xFFFFF9C4),
      drift: Tween(begin: Offset(7, -5), end: Offset(-7, 5)),
      angle: 0.95,
    ),
    AnimatedPostItSticker(
      baseTop: size.height - 340,
      baseLeft: size.width - 530,
      size: 180,
      color: const Color(0xFFE1BEE7),
      drift: Tween(begin: Offset(-10, -5), end: Offset(10, 5)),
      angle: -0.2,
    ),
  ];
}
