import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/yellow_button.dart';
import '../../../core/widgets/textfields/phone_field.dart';
import '../bloc/check_bloc.dart';

class CheckWidget extends StatefulWidget {
  const CheckWidget({super.key});

  @override
  State<CheckWidget> createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Узнайте, кто вам звонил',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.basicBlack3,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: PhoneField(
                controller: controller,
                onChanged: () {
                  context.read<CheckBloc>().add(ListenEvent());
                },
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 80,
              child: BlocBuilder<CheckBloc, CheckState>(
                builder: (context, state) {
                  if (state is CheckInitial) {
                    return YellowButton(
                      title: 'Узнать',
                      active: Utils.phoneValid,
                      onPressed: () {
                        context
                            .read<CheckBloc>()
                            .add(CheckButtonEvent(controller.text));
                      },
                    );
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
