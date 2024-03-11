import 'package:appstore/feature/boarding/data/model/model_pageview.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem(this.pageViewHorizontal, {super.key});

  final PageViewHorizontal pageViewHorizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(pageViewHorizontal.image1e.toString())),
          Text('${pageViewHorizontal.text1e}',
              style: const TextStyle(fontSize: 30)),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            Text(pageViewHorizontal.text2e.toString()),
            const Text(
              'Tm',
              style: TextStyle(fontSize: 10),
            )
          ]),
        ],
      ),
    );
  }
}
