import 'package:anilibria_clone/theme/colors.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final TextStyle textStyle;

  const StandardButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(4),
        elevation: 3,
        child: Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AnilibriaColor.white,
            borderRadius: BorderRadius.circular(4),

          ),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
