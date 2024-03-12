import 'package:appstore/core/utils/component.dart';
import 'package:appstore/feature/auth/persentation/view/register_view.dart';

import 'package:flutter/material.dart';

class TextRegisterbutton extends StatelessWidget {
  const TextRegisterbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don`t have an account'),
        TextButton(
            onPressed: () => navigatorTo(context, const RegistorView()),
            child: const Text('Register'))
      ],
    );
  }
}
