// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:anilibria_clone/theme/colors.dart';
import 'package:anilibria_clone/theme/text_styles.dart';

class WeekDay extends StatelessWidget {
  const WeekDay({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> list = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        list.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AnilibriaColor.black,
              width: 0.5,
            ),
          ),
          child: Text(
            list[index],
            style: AnilibriaTextStyle.small1(AnilibriaColor.grey1),
          ),
        ),
      ),
    );
  }
}
