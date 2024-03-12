import 'package:flutter/material.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({super.key, required this.textOne, required this.textTwo});
  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(textOne,
          style:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 30)),
      Text(
        textTwo,
        style: Theme.of(context).textTheme.bodyLarge,
      )
    ]);
  }
}
