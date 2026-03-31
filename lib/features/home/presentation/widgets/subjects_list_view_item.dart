import 'package:flutter/material.dart';

import '../../../../core/values/assets.gen.dart';

class SubjectsListViewItem extends StatelessWidget {
  const SubjectsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      padding: const EdgeInsets.only(top: 25, bottom: 25, left: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.a3dIcons.draftingTools.path,
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 12),
          Text(
            'Math',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
