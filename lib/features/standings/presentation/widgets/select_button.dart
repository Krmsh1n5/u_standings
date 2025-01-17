import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/core/utils/theme/app_decoration.dart';
import 'package:u_standings/core/utils/theme/custom_text_styles.dart';

class CohortSemesterSelectorButton extends StatelessWidget {
  final String title;
  final Future<List<String>> Function()? fetchOptions; // Fetch from API/DB
  final List<String>? staticOptions; // Predefined list
  final ValueChanged<String> onOptionSelected;

  const CohortSemesterSelectorButton({
    super.key,
    required this.title,
    this.fetchOptions,
    this.staticOptions,
    required this.onOptionSelected,
  }) : assert(
            (fetchOptions != null && staticOptions == null) ||
                (fetchOptions == null && staticOptions != null),
            'Provide either fetchOptions or staticOptions, not both.');

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Fetch options (from API/DB or static)
        List<String> options;
        if (fetchOptions != null) {
          options = await fetchOptions!();
        } else {
          options = staticOptions!;
        }

        // Show modal bottom sheet
        final selectedOption = await showModalBottomSheet<String>(
          backgroundColor: Colors.white,
          // ignore: use_build_context_synchronously
          context: context,
          showDragHandle: true,
          builder: (context) => Container(
            // color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Make Selection!',
                      style: CustomTextStyles.titleLargeOnSurface,
                    ),
                    Text(
                      'Select one of the available cohorts/faculties and semesters below to see other results.',
                      style: CustomTextStyles.bodySmallOnSecondaryContainer,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          options[index],
                          style: CustomTextStyles.titleMediumOnSurface,
                        ),
                        onTap: () => Navigator.pop(context, options[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );

        // Handle selection
        if (selectedOption != null) {
          onOptionSelected(selectedOption);
        }
      },
      style: AppDecoration().elevatedButtonStyle(true).copyWith(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.circleBorder24,
              ),
            ),
          ),
      child: Text(title,
          style: CustomTextStyles.bodyMediumOnPrimary16
              .copyWith(letterSpacing: 0.5)),
    );
  }
}
