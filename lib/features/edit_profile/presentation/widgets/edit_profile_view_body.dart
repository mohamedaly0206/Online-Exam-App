import 'package:flutter/material.dart';
import 'package:online_exam_app/core/values/app_strings.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&iar=0&w=600&hash=833D605FDB6AC3C2D2915F6BF8B4ADA4',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 33,
                  width: 33,
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
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.userName),
              hintText: 'Enter your user name',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(AppStrings.firstName),
                    hintText: 'Enter first name',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(AppStrings.lastName),
                    hintText: 'Enter last name',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.email),
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.displayLarge
                        ?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  onPressed: () {},
                  child: Text(AppStrings.change),
                ),
              ),
              label: Text(AppStrings.password),
              hintText: 'Enter your password',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              label: Text(AppStrings.phone),
              hintText: 'Enter your phone number',
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            child: Text(AppStrings.updateButton),
          ),
        ],
      ),
    );
  }
}
