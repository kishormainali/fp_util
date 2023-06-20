import 'package:flutter/material.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    super.key,
    this.color = Colors.blue,
    this.valueColor = Colors.white,
    this.radius = 24,
    this.stroke = 1.8,
  });

  const AppIndicator.inverse({
    super.key,
    this.color = Colors.white,
    this.valueColor = Colors.blue,
    this.radius = 24,
    this.stroke = 1.8,
  });

  final Color color;
  final Color valueColor;
  final double radius;
  final double stroke;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
          strokeWidth: stroke,
        ),
      ),
    );
  }
}
