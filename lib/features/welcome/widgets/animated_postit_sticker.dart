import 'package:flutter/material.dart';

class AnimatedPostItSticker extends StatefulWidget {
  final double baseTop;
  final double baseLeft;
  final double size;
  final Color color;
  final Tween<Offset> drift;
  final double angle;

  const AnimatedPostItSticker({
    super.key,
    required this.baseTop,
    required this.baseLeft,
    required this.size,
    required this.color,
    required this.drift,
    this.angle = 0.0,
  });

  @override
  State<AnimatedPostItSticker> createState() => _AnimatedPostItStickerState();
}

class _AnimatedPostItStickerState extends State<AnimatedPostItSticker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  )..repeat(reverse: true);

  late final Animation<Offset> _driftAnimation = widget.drift.animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final offset = _driftAnimation.value;
        return Positioned(
          left: widget.baseLeft + offset.dx,
          top: widget.baseTop + offset.dy,
          child: Transform.rotate(
            angle: widget.angle,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
