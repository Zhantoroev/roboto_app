import 'package:flutter/material.dart';

import '../models/roboto.dart';
import 'roboto_item.dart';

class RobotoList extends StatelessWidget {
  final List<Roboto> robots;

  const RobotoList({
    Key? key,
    required this.robots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: robots.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          child: RobotoItem(roboto: robots[index]),
        );
      },
    );
  }
}
