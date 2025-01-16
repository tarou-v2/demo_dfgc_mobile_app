import '../models/dapp.dart';

final List<DApp> dummyDapps = [
  DApp(
    name: 'Yamato Protocol',
    category: 'Stablecoin',
    dappUrl: 'https://app.yamato.fi/#/',
    dappEnUrl: '',
    imagePath: '',
    documentsUrl: 'https://docs.yamato.fi/',
    documentsEnUrl: 'https://docs.yamato.fi/en',
    xTwitter: 'https://twitter.com/YamatoProtocol',
    xTwitterEn: '',
    audits: {
      'BlockApex': 'https://github.com/BlockApex/Audit-Reports/blob/master/Yamato%20Protocol%20Final%20Audit.pdf',
      'Immunefi': 'https://immunefi.com/bounty/yamatoprotocol/'
    },
    links: {
      'DefiLlama': 'https://defillama.com/protocol/yamato-protocol',
      'Dune Dashboard': 'https://dune.com/dfgc/yamato',
      'Pledges List (beta)': 'https://glitch.com/~yamato-protocol-pledges-list',
    },
    contracts: {},
  ),
  DApp(
    name: 'Yabumi',
    category: 'NFT',
    dappUrl: 'https://www.yabumi.xyz/',
    dappEnUrl: 'https://www.yabumi.xyz/en#',
    imagePath: '',
    documentsUrl: 'https://doc.yabumi.xyz/',
    documentsEnUrl: 'https://doc.yabumi.xyz/english',
    xTwitter: '',
    xTwitterEn: '',
    audits: {},
    links: {},
    contracts: {},
  ),
  DApp(
    name: 'punodwoɔ',
    category: 'Lending',
    dappUrl: 'https://pnd.defigeek.xyz/',
    dappEnUrl: '',
    imagePath: '',
    documentsUrl: 'https://defigeek.gitbook.io/punodwo-document',
    documentsEnUrl: '',
    xTwitter: '',
    xTwitterEn: '',
    audits: {},
    links: {},
    contracts: {},
  ),
  DApp(
    name: 'Yamawake',
    category: 'Auction',
    dappUrl: 'https://yamawake.xyz/',
    dappEnUrl: '',
    imagePath: '',
    documentsUrl: 'https://docs.yamawake.xyz/',
    documentsEnUrl: 'https://docs.yamawake.xyz/english-3',
    xTwitter: '',
    xTwitterEn: '',
    audits: {},
    links: {},
    contracts: {},
  ),
];

final List<DApp> initialDapps = [];
