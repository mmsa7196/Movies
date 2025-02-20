import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/customs/button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: AppColors.secondary,
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              height: 100, width: 100, child: CircleAvatar()),
                          Text(
                            "data",
                            style: textTheme.bodyLarge,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "33",
                            style: textTheme.titleLarge,
                          ),
                          Text(
                            "data",
                            style: textTheme.titleSmall,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "33",
                            style: textTheme.titleLarge,
                          ),
                          Text(
                            "data",
                            style: textTheme.titleSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                /////button
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                          color: AppColors.button,
                          widget: Text("Edit Profile",
                              style: textTheme.bodyMedium!
                                  .copyWith(color: AppColors.primary)),
                          textColor: AppColors.primary,
                          textStyle: textTheme.bodyMedium!
                              .copyWith(color: AppColors.primary)),
                    ),
                    Expanded(
                      child: CustomButton(
                          border: false,
                          color: AppColors.buttonRed,
                          widget: Row(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Exit"),
                              Icon(
                                Icons.exit_to_app_rounded,
                                color: AppColors.text,
                              ),
                            ],
                          ),
                          textColor: AppColors.primary,
                          textStyle: textTheme.bodyMedium!),
                    ),
                  ],
                ),
                /////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.menu,
                          color: AppColors.button,
                          size: 40,
                        ),
                        Text("Watch List")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.folder,
                          color: AppColors.button,
                          size: 40,
                        ),
                        Text("Histories")
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              AppImages.empty,
              height: h * 0.2,
              width: w * 0.4,
            ),
          )
        ],
      ),
    );
  }
}
