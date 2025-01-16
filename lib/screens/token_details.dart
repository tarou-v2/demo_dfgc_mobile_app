import 'package:demo_dfgc_mobile_app/widgets/web_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/token.dart';
import '../providers/token_data.dart';

class TokenDetailsScreen extends ConsumerWidget {
  final Token token;

  const TokenDetailsScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenDataAsync = ref.watch(tokenDataProvider(
        (network: token.network, tokenAddress: token.contract)));

    final List<Map<String, String?>> links = [
      {'label': 'Website', 'value': token.websiteUrl},
      {'label': 'Website(EN)', 'value': token.websiteEnUrl},
      {'label': 'Documents', 'value': token.documentsUrl},
      {'label': 'Documents(EN)', 'value': token.documentsEnUrl},
      {'label': 'Twitter', 'value': token.xTwitter},
      {'label': 'Twitter(EN)', 'value': token.xTwitterEn},
      {'label': 'Etherscan', 'value': 'https://etherscan.io/address/${token.contract}'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(token.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Symbol:${token.symbol}'),
            SizedBox(height: 10),
            Text('Total Supply:'),
            SizedBox(height: 10),
            Text('Holders:'),
            SizedBox(height: 10),
            Text('Links:'),
            SizedBox(height: 10,),
            ...links.map((item) {
              final String linkTitle = item['label']!;
              final String? linkUrl = item['value'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text('$linkTitle:'),
                      linkUrl != null ? WebLinkWidget(uri: Uri.parse(linkUrl), text: linkUrl) : Text(''),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              );
            }),
            ...token.links.entries.map((entry) {
              final String linkTitle = entry.key; // リンクのタイトル（キー）
              final String linkUrl = entry.value; // リンクのURL（値）

              return Wrap(
                children: [
                  Text('$linkTitle:'),
                  WebLinkWidget(uri: Uri.parse(linkUrl), text: linkUrl)
                ]
              );
            })
          ],
        ),
      ),
    );
  }
}
