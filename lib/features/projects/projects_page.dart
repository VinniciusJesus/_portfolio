import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final projects = const [
    {
      'image': 'assets/svg/kinsol.png',
      'googlePlay':
          'https://play.google.com/store/apps/details?id=com.energiasolar.kinsol.app',
      'appStore': 'https://apps.apple.com/us/app/app-kinsol/id6651822106',
    },
    {
      'image': 'assets/svg/seg.png',
      'googlePlay':
          'https://play.google.com/store/apps/details?id=br.com.segcontrole.segcel',
      'appStore': 'https://apps.apple.com/br/app/seg-alerta/id1487156929',
    },
    {
      'image': 'assets/svg/achou.png',
      'googlePlay':
          'https://play.google.com/store/apps/details?id=br.com.segcontrole.segme',
      'appStore': 'https://apps.apple.com/br/app/achou-me/id6449781167',
    },
    {
      'image': 'assets/svg/anotei.png',
      'github': 'https://github.com/VinniciusJesus/anotei',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final crossAxisCount = isMobile ? 2 : 4;

    return Container(
      width: double.infinity,
      color: const Color(0xffFEFFF0),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          Text(
            'Projetos',
            style: GoogleFonts.chakraPetch(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: GridView.builder(
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7, // controla altura
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: _HoverableCard(imagePath: project['image']!),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (project['googlePlay'] != null)
                            _LinkButton(
                              label: 'Google Play',
                              icon: Icons.android,
                              url: project['googlePlay']!,
                            ),
                          if (project['appStore'] != null)
                            _LinkButton(
                              label: 'App Store',
                              icon: Icons.apple,
                              url: project['appStore']!,
                            ),
                          if (project['github'] != null)
                            _LinkButton(
                              label: 'GitHub',
                              icon: Icons.code,
                              url: project['github']!,
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverableCard extends StatefulWidget {
  final String imagePath;

  const _HoverableCard({required this.imagePath});

  @override
  State<_HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<_HoverableCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final transform =
        _hovering
            ? (Matrix4.identity()
              ..translate(0.0, -6.0)
              ..scale(1.03))
            : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: transform,
        child: Image.asset(widget.imagePath, fit: BoxFit.cover),
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final String url;

  const _LinkButton({
    required this.label,
    required this.icon,
    required this.url,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovering = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAndroid = widget.label.toLowerCase().contains('google');
    final isIOS = widget.label.toLowerCase().contains('app store');
    final isGitHub = widget.label.toLowerCase().contains('github');

    final backgroundColor =
        _hovering
            ? isAndroid
                ? const Color(0xFF90ee90)
                : const Color(0xFF333333)
            : Colors.white;

    final textColor =
        _hovering ? (isAndroid ? Colors.black : Colors.white) : Colors.black;

    final iconColor = textColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 16, color: iconColor),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
