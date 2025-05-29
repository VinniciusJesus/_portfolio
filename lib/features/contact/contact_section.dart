import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xffe3dff2),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Column(
        children: [
          Text(
            'Contato',
            style: GoogleFonts.chakraPetch(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Entre em contato comigo pelas redes abaixo:',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              _ContactButton(
                label: 'LinkedIn',
                icon: Icons.business,
                hoverColor: const Color(0xFF0077B5),
                onTap: () async {
                  final uri = Uri.parse(
                    'https://www.linkedin.com/in/vinnicius-de-jesus/',
                  );
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                },
              ),
              _ContactButton(
                label: 'GitHub',
                icon: Icons.code,
                hoverColor: const Color(0xFF333333),
                onTap: () async {
                  final uri = Uri.parse('https://github.com/VinniciusJesus');
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                },
              ),
              _ContactButton(
                label: 'E-mail',
                icon: Icons.mail,
                hoverColor: const Color(0xFFFF8A80),
                onTap: () async {
                  await Clipboard.setData(
                    const ClipboardData(text: 'viniciusdejesus565@gmail.com'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color hoverColor;
  final Future<void> Function() onTap;

  const _ContactButton({
    required this.label,
    required this.icon,
    required this.hoverColor,
    required this.onTap,
  });

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _hovering = false;
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    final isEmail = widget.label.toLowerCase() == 'e-mail';
    final bgColor = _hovering ? widget.hoverColor : Colors.white;
    final textColor = _hovering ? Colors.white : Colors.black;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () async {
          await widget.onTap();
          if (isEmail) {
            setState(() => _copied = true);
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) setState(() => _copied = false);
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 20, color: textColor),
              const SizedBox(width: 8),
              Text(
                _copied ? 'Copiado' : widget.label,
                style: TextStyle(
                  fontSize: 14,
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
