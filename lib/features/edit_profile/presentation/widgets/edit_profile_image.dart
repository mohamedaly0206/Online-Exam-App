import 'package:flutter/material.dart';

import '../../../../core/values/app_strings.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 104,
            height: 104,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppStrings.defaultImage),
              ),
            ),
          ),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryFixed,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 20,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
