import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed; // 👈 make it optional
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: AppBar(
          leading: InkWell(
            onTap: () {
              if (onBackPressed != null) {
                onBackPressed!();
              } else {
                GoRouter.of(context).pop();
              }
            },
            child: Center(child: SvgPicture.asset(Assets.icons.arrowBackIcon)),
          ),
          title: Text(title),
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
