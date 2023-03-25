import 'package:flutter/material.dart';
import 'package:task_03/presentation/theme_animation/widgets/sun_sunshine.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return SunShine(
      radius: 130,
      child: SunShine(
        radius: 100,
        child: SunShine(
          radius: 80,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color(0xDDFC554F),
                  Color(0xDDFFF79E),
                ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
          ),
        ),
      ),
    );
  }
}
