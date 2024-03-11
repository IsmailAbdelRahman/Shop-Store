import 'package:appstore/feature/search/data/model/model_search.dart';
import 'package:flutter/material.dart';

class CustomSearchView extends StatelessWidget {
  final Datalist data;
  const CustomSearchView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: NetworkImage(data.image.toString()),
        width: 50,
      ),
      title: Text(
        data.name.toString(),
        overflow: TextOverflow.clip,
        maxLines: 3,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
