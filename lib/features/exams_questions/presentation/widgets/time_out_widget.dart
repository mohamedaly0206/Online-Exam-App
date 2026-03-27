import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/core/values/assets.gen.dart';

class TimeOutWidget extends StatelessWidget {
  const TimeOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(children: [
            SvgPicture.asset(
              Assets.a3dIcons.sandClock,
            ),
            const SizedBox(width: 8),
            Text(
              'Time out !!',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ],),
          SizedBox(height: 24),
          ElevatedButton(onPressed: (){}, child: Text(AppStrings.viewScore),)
        
      ]),
    );
  }
}
