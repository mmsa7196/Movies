import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/model/avatar%20model.dart';

class AvatarItem extends StatelessWidget {
  AvatarItem(
      {required this.onClicked(index),
      this.isSelected = false,
      required this.index,
      super.key});

  Function onClicked;
  int index;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClicked(index);
      },
      child: Container(
        height: 105,
        width: 108,
        decoration: BoxDecoration(
            color: isSelected
                ? AppColors.button.withOpacity(.5)
                : Colors.transparent,
            border: Border.all(
              color: AppColors.button,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Image.asset(AvatarModel.avatars[index].image),
      ),
    );
  }
}
