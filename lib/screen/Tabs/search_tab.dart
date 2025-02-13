import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 21,),
              TextField(
                cursorColor: AppColors.text,
                decoration: InputDecoration(
                  fillColor: AppColors.secondary,
                  filled: true,
                  hintText: "Search",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ImageIcon(AssetImage(AppImages.search,),color: AppColors.text,),
                  ),
                  hintStyle: TextStyle(color: AppColors.text,fontSize: 16,fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.greyScreen,
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.button,
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.greyScreen,
                    ),
                  ) ,
                ),
              ),
              SizedBox(height: 16,),
              Spacer(),
              Column(children: [
                Image.asset("assets/Empty.png",height:124 ,width:124 ,),
              ],),
              Spacer(),
            ],

          ),
        ),
      ),
    );
  }
  }