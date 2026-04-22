import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam_app/features/change_password/presentation/view/change_password_view.dart';
import 'package:online_exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:online_exam_app/features/home/presentation/view_model/state/home_states.dart';
import 'package:online_exam_app/features/home/presentation/widgets/home_view_body.dart';

import '../../../../core/values/app_strings.dart';
import '../../../../core/values/assets.gen.dart';
import '../view_model/intent/home_intent.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<Widget> _tabs = [
    HomeViewBody(),
    Center(child: Text(AppStrings.result)),
    ChangePasswordView(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state.currentIndex, children: _tabs),
          bottomNavigationBar: NavigationBar(
            height: height * 0.08,
            selectedIndex: state.currentIndex,
            onDestinationSelected: (index) {
              BlocProvider.of<HomeCubit>(
                context,
              ).doIntent(ChangeTapIntent(index));
            },
            indicatorColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.12),
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.homeIcon,
                  height: height * 0.033,
                  width: height * 0.033,
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
                  height: height * 0.033,
                  width: height * 0.033,
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
                  height: height * 0.033,
                  width: height * 0.033,
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
