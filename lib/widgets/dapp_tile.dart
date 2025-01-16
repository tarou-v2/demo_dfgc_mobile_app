import 'package:flutter/material.dart';

import '../models/dapp.dart';
import '../screens/dapp_details.dart';

class DappTile extends StatelessWidget {
  final DApp dapp;

  const DappTile({required this.dapp});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: DappDetailsScreen(dapp: dapp),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              //backgroundImage: NetworkImage(dapp.imagePath),
              radius: 15,
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Wrap(
                spacing: 4.0,
                children: [
                  Text(
                    dapp.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dapp.category,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('TVL:\$-', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}