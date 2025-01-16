class DApp {
  final String name;
  final String category;
  final String dappUrl;
  final String dappEnUrl;
  final String imagePath;
  final String documentsUrl;
  final String documentsEnUrl;
  final String xTwitter;
  final String xTwitterEn;
  final Map<String, String> audits;
  final Map<String, String> links;
  final Map<String, String> contracts;

  DApp({
    required this.name,
    required this.category,
    required this.dappUrl,
    required this.dappEnUrl,
    required this.imagePath,
    required this.documentsUrl,
    required this.documentsEnUrl,
    required this.xTwitter,
    required this.xTwitterEn,
    required this.audits,
    required this.links,
    required this.contracts
  });
}
