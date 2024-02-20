import 'package:flutter/material.dart';

loading({
  Color? color,
  double? width,
  double? height,
  double? strokeWidth,
}) {
  return SizedBox(
    width: width ?? 20.0,
    height: height ?? 20.0,
    child: CircularProgressIndicator(
      strokeWidth: strokeWidth ?? 4.0,
      valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
    ),
  );
}

class CenterLoadingWidget extends StatelessWidget {
  const CenterLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loading(color: Colors.blue.shade800),
    );
  }
}
