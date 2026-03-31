import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.survey,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.search,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10,
                    left: 16,
                    right: 0,
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.searchIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.placeHolderColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  //borderSide: BorderSide(color: Theme.of(context)),
                ),
                hintStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.placeHolderColor,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
