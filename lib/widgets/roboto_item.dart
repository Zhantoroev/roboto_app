import 'package:flutter/material.dart';

import '../models/roboto.dart';

class RobotoItem extends StatelessWidget {
  final Roboto roboto;

  const RobotoItem({Key? key, required this.roboto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          SizedBox(
            height: 200.0,
            child: Image.network(
              'https://robohash.org/${roboto.id}?200x200',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              roboto.name ?? "No name",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              roboto.email ?? "No email",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
