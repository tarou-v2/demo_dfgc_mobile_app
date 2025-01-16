class Token {
  final String fullName;
  final String symbol;
  final String network;
  final String contract;
  final String imagePath;
  final String websiteUrl;
  final String websiteEnUrl;
  final String documentsUrl;
  final String documentsEnUrl;
  final String xTwitter;
  final String xTwitterEn;
  final Map<String, String> links;

  Token({
    required this.fullName,
    required this.symbol,
    required this.network,
    required this.contract,
    required this.imagePath,
    required this.websiteUrl,
    required this.websiteEnUrl,
    required this.documentsUrl,
    required this.documentsEnUrl,
    required this.xTwitter,
    required this.xTwitterEn,
    required this.links,
  });
}
