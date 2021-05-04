import 'package:flutter/material.dart';

class ChampionsListItem extends StatelessWidget {
  final String id;
  final String name;
  final String urlImage;

  const ChampionsListItem({
    Key? key, required this.id, required this.name, required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key("show_item_champion_$id"),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: NetworkImage(
                    urlImage,
                  ),
                  fit: BoxFit.scaleDown,
                )),
          ),
        ),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
