import 'package:flutter/material.dart';

import '../constants/dapp_data.dart';
import '../widgets/dapp_tile.dart';

class DappListScreen extends StatefulWidget {
  const DappListScreen({super.key});

  @override
  State<DappListScreen> createState() => _DappListScreenState();
}

class _DappListScreenState extends State<DappListScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...dummyDapps.map((dapp) =>DappTile(dapp: dapp)).toList(),
        ],
      ),
    );
  }
}
