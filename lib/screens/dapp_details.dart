import 'package:flutter/material.dart';
import '../models/dapp.dart';
import '../widgets/web_link.dart';

class DappDetailsScreen extends StatelessWidget {
  final DApp dapp;

  const DappDetailsScreen({required this.dapp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dapp.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category:${dapp.category}'),
            SizedBox(height: 10),
            Text('Links:'),
            SizedBox(height: 10),
            Text('App:${dapp.dappUrl}'),
            SizedBox(height: 10),
            Text('App(EN):${dapp.dappEnUrl}'),
            SizedBox(height: 10),
            Text('Documents:${dapp.documentsEnUrl}'),
            SizedBox(height: 10),
            Text('Documents(EN):${dapp.documentsEnUrl}'),
            SizedBox(height: 10),
            ...dapp.links.entries.map((entry) {
              final String linkTitle = entry.key;
              final String linkUrl = entry.value;

              return Wrap(
                children: [
                  Text('$linkTitle:'),
                  WebLinkWidget(uri: Uri.parse(linkUrl), text: linkUrl)
                ]
              );
            }),
            Text('Audits:'),
            ...dapp.audits.entries.map((entry) {
              final String linkTitle = entry.key;
              final String linkUrl = entry.value;

              return Wrap(
                children: [
                  Text('$linkTitle:'),
                  WebLinkWidget(uri: Uri.parse(linkUrl), text: linkUrl)
                ]
              );
            }),
          ],
        ),
      ),
    );
  }
}
