import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebLinkWidget extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final Uri uri;

  const WebLinkWidget({
    super.key,
    this.icon,
    this.text,
    required this.uri,
  });

  Future<void> _launchURL() async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText = text ?? uri.toString();

    return InkWell(
      onTap: _launchURL,
      child: Wrap(
        spacing: 8.0,
        children: [
          if (icon != null) icon!,
          if (icon != null && text != null) SizedBox(width: 8),
          Text(
            displayText,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}