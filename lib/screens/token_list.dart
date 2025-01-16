import 'package:flutter/material.dart';

import '../constants/token_data.dart';
import '../widgets/token_tile.dart';

class TokenListScreen extends StatefulWidget {
  const TokenListScreen({super.key});

  @override
  State<TokenListScreen> createState() => _TokenListScreenState();
}

class _TokenListScreenState extends State<TokenListScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dummyTokens.length, // リストのアイテム数
        itemBuilder: (context, index) {
          final token = dummyTokens[index];
          return TokenTile(token: token);
        },
      ),
    );
  }
}
