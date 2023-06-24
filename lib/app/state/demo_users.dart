import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

late StreamFeedClient serverClient;

String? apiKey = 'dnr3fd6k83bt';
String? apiSecret = 'f2w3w75k28y4dfmmtercm3dhwjt7nbfc48m9s65rurmn42uh6kce6u4ssyrcspfm';

void generate() {
  print('\nCreating server client...\n');
  serverClient = StreamFeedClient(
    apiKey!,
    secret: apiSecret,
    runner: Runner.server,
  );
}

enum DemoAppUser {
  andy,
  aurel,
  farhan,
  levina,
  maggie,
}

extension DemoAppUserX on DemoAppUser {
  String get id => {
        DemoAppUser.andy: 'andhika-putra',
        DemoAppUser.aurel: 'aurelia-aurelia',
        DemoAppUser.farhan: 'farhan-adithya',
        DemoAppUser.levina: 'levina-olivia',
        DemoAppUser.maggie: 'maggie-lim',
      }[this]!;

  String? get name => {
        DemoAppUser.andy: 'Andhika Putra',
        DemoAppUser.aurel: 'Aurelia Aurelia',
        DemoAppUser.farhan: 'Farhan Adithya',
        DemoAppUser.levina: 'Levina Olivia',
        DemoAppUser.maggie: 'Maggie Lim',
      }[this];

  Map<String, Object>? get data => {
        DemoAppUser.andy: {
          'first_name': 'Andhika',
          'last_name': 'Putra',
          'full_name': 'Andhika Putra',
        },
        DemoAppUser.aurel: {
          'first_name': 'Aurelia',
          'last_name': 'Aurelia',
          'full_name': 'Aurelia Aurelia',
        },
        DemoAppUser.farhan: {
          'first_name': 'Farhan',
          'last_name': 'Farhan Adithya',
          'full_name': 'Farhan Adithya',
        },
        DemoAppUser.levina: {
          'first_name': 'Levina',
          'last_name': 'Olivia',
          'full_name': 'Levina Olivia',
        },
        DemoAppUser.maggie: {
          'first_name': 'Maggie',
          'last_name': 'Lim',
          'full_name': 'Maggie Lim',
        },
      }[this];

  Token? get token {
    final frontendTokens = <DemoAppUser, Token>{
      DemoAppUser.andy: serverClient.frontendToken('andhika-putra'),
      DemoAppUser.aurel: serverClient.frontendToken('aurelia-aurelia'),
      DemoAppUser.farhan: serverClient.frontendToken('farhan-adithya'),
      DemoAppUser.levina: serverClient.frontendToken('levina-olivia'),
      DemoAppUser.maggie: serverClient.frontendToken('maggie-lim'),
    };

    return frontendTokens[this];
  }
}
