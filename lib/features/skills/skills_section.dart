import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final skills = const [
    {'name': 'Flutter', 'icon': Icons.flutter_dash},
    {'name': 'Firebase', 'icon': Icons.cloud},
    {'name': 'REST APIs', 'icon': Icons.http},
    {'name': 'Git', 'icon': Icons.merge_type},
    {'name': 'Clean Architecture', 'icon': Icons.architecture},
    {'name': 'UI/UX', 'icon': Icons.design_services},
    {'name': 'n8n', 'icon': Icons.settings_ethernet},
    {'name': 'Flowise', 'icon': Icons.memory},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final crossAxisCount = isMobile ? 2 : 4;

    return Container(
      width: double.infinity,
      color: const Color(0xffc4a1ff),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 96),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Habilidades',
                style: GoogleFonts.chakraPetch(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children:
                    skills.asMap().entries.map((entry) {
                      final i = entry.key;
                      final skill = entry.value;

                      return HoverSkillCard(
                        icon: skill['icon'] as IconData,
                        name: skill['name'] as String,
                        index: i,
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverSkillCard extends StatefulWidget {
  final IconData icon;
  final String name;
  final int index;

  const HoverSkillCard({
    super.key,
    required this.icon,
    required this.name,
    required this.index,
  });

  @override
  State<HoverSkillCard> createState() => _HoverSkillCardState();
}

class _HoverSkillCardState extends State<HoverSkillCard> {
  bool _hovering = false;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final tiltAngle = widget.index.isEven ? 0.02 : -0.02;

    final Matrix4 transformMatrix =
        _hovering
            ? (Matrix4.identity()
              ..translate(0.0, -8.0)
              ..scale(1.05)
              ..rotateZ(tiltAngle))
            : Matrix4.identity();

    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      transform: transformMatrix,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(4, 4))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 60, color: Colors.black),
          const SizedBox(height: 12),
          Text(
            widget.name,
            style: GoogleFonts.chakraPetch(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );

    return VisibilityDetector(
      key: Key('skill-${widget.name}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0 && !_visible) {
          setState(() {
            _visible = true;
          });
        }
      },
      child:
          _visible
              ? MouseRegion(
                onEnter: (_) => setState(() => _hovering = true),
                onExit: (_) => setState(() => _hovering = false),
                child: card
                    .animate()
                    .fadeIn(delay: (widget.index * 100).ms)
                    .slideY(begin: 0.2),
              )
              : const SizedBox(),
    );
  }
}
