import 'package:flutter/material.dart';
import 'package:demo_dfgc_mobile_app/widgets/web_link.dart';

const Map<String, String> items = {
  'Treasury Multisig': 'https://app.safe.global/home?safe=eth:0x153d9DD730083e53615610A0d2f6F95Ab5A0Bc01',
  'Dev Multisig': 'https://app.safe.global/home?safe=eth:0x0b0A167a0b6800207c89544D2eBdC98DCdD33bec',
  'Snapshot': 'https://vote.defigeek.xyz/#/',
};

class GovernanceScreen extends StatelessWidget {
  const GovernanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = items.entries.toList();

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  final label = entry.key;
                  final url = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 4.0,
                        children: [
                          Text(label),
                          WebLinkWidget(uri: Uri.parse(url)),
                        ],
                      ),
                      SizedBox(height: 16.0,)
                    ],
                  );
                },
              ),
            ),
            Text('Snapshot View Area')
          ],
        ),
      ),
    );
  }
}