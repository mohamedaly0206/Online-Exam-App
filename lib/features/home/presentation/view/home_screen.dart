import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:online_exam_app/features/home/presentation/view_model/state/home_states.dart';
import 'package:online_exam_app/features/home/presentation/widgets/home_view_body.dart';

import '../../../../core/values/app_strings.dart';
import '../../../../core/values/assets.gen.dart';
import '../view_model/intent/home_intent.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Widget> _tabs = [
    HomePage(),
    Center(child: Text(AppStrings.result)),
    Center(child: Text(AppStrings.profile)),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return Scaffold(
          // to save the state of each tab when switching between them
          body: IndexedStack(index: state.currentIndex, children: _tabs),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.currentIndex,
            onDestinationSelected: (index) {
              BlocProvider.of<HomeCubit>(
                context,
              ).doIntent(ChangeTapIntent(index));
            },
            indicatorColor: Theme.of(
              context,
            ).colorScheme.primary.withOpacity(0.12),
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.homeIcon,
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: AppStrings.explore,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.resultIcon,
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: AppStrings.result,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.personIcon,
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: AppStrings.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
