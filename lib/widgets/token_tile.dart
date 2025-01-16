import 'package:demo_dfgc_mobile_app/providers/token_data.dart';
import 'package:demo_dfgc_mobile_app/screens/token_details.dart';
import 'package:demo_dfgc_mobile_app/utils/number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/token.dart';

class TokenTile extends ConsumerWidget {
  final Token token;

  const TokenTile({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenDataAsync = ref.watch(tokenDataProvider(
        (network: token.network, tokenAddress: token.contract)));

    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: TokenDetailsScreen(token: token),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
        child: tokenDataAsync.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stack) {
              // 例外が発生した場合、デフォルト値を表示
              return Row(
                children: [
                  CircleAvatar(
                    //backgroundImage: NetworkImage(token.imagePath),
                    radius: 15,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Wrap(
                      spacing: 4.0,
                      children: [
                        Text(
                          token.fullName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          token.symbol,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('\$-',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('1H:-%', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('24H:-%', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('VOL:\$-', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('FDV:\$-', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            data: (tokenData) {
              final firstPool = tokenData['data'][0];
              final price = double.parse(firstPool['attributes']['token_price_usd']).toStringAsFixed(4);
              final change1h = firstPool['attributes']['price_change_percentage']['h1'];
              final change24h = firstPool['attributes']['price_change_percentage']['h24'];
              final volume24h = firstPool['attributes']['volume_usd']['h24'];
              final fdv = firstPool['attributes']['fdv_usd'];
              return Row(
                children: [
                  CircleAvatar(
                    //backgroundImage: NetworkImage(token.imagePath),
                    radius: 15,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Wrap(
                      spacing: 4.0,
                      children: [
                        Text(
                          token.fullName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${token.symbol}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('\$$price',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('1H:', style: TextStyle(color: Colors.grey)),
                            Text('$change1h%',
                                style: TextStyle(
                                    color: double.parse(change1h) >= 0
                                        ? Colors.green
                                        : Colors.red)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('24H:', style: TextStyle(color: Colors.grey)),
                            Text('$change24h%',
                                style: TextStyle(
                                    color: double.parse(change24h) >= 0
                                        ? Colors.green
                                        : Colors.red)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('VOL:', style: TextStyle(color: Colors.grey)),
                            Text('\$${formatNumber(double.parse(volume24h))}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('FDV:', style: TextStyle(color: Colors.grey)),
                            Text('\$${formatNumber(double.parse(fdv))}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}