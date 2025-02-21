import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/customs/avatar_item.dart';
import 'package:movies/model/avatar%20model.dart';

class AvatarsSheetSection extends StatelessWidget {
  AvatarsSheetSection({super.key});

  bool selectedAvatar = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 17, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Scaffold(
          backgroundColor: AppColors.greyScreen,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AvatarItem(
                      index: 0,
                      isSelected: selectedAvatar,
                      onClicked: (index) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AvatarItem(
                      index: 1,
                      onClicked: (index) {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AvatarItem(index: 2, onClicked: (index) {}),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Row(
                  children: [
                    AvatarItem(index: 3, onClicked: (index) {}),
                    SizedBox(
                      width: 10,
                    ),
                    AvatarItem(index: 4, onClicked: (index) {}),
                    SizedBox(
                      width: 10,
                    ),
                    AvatarItem(index: 5, onClicked: (index) {}),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Row(
                  children: [
                    AvatarItem(index: 6, onClicked: (index) {}),
                    SizedBox(
                      width: 10,
                    ),
                    AvatarItem(index: 7, onClicked: (index) {}),
                    SizedBox(
                      width: 10,
                    ),
                    AvatarItem(index: 8, onClicked: (index) {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
