import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';
import 'package:online_exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:online_exam_app/features/home/presentation/view_model/intent/home_intent.dart';
import 'package:online_exam_app/features/home/presentation/widgets/subjects_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              onChanged: (value) {
                BlocProvider.of<HomeCubit>(
                  context,
                ).doIntent(SearchSubjectsIntent(value));
              },
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
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  //borderSide: BorderSide(color: Theme.of(context)),
                ),
                hintStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.placeHolderColor,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              AppStrings.browseBySubject,
              style: Theme.of(context).textTheme.titleMedium!,
            ),
            const SizedBox(height: 24),
            SubjectsListView(),
          ],
        ),
      ),
    );
  }
}
