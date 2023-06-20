import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_agram/app/app.dart';
import 'package:stream_feed_flutter_core/stream_feed_flutter_core.dart';

import '../components/login/login.dart';

class StreamagramApp extends StatefulWidget {
  const StreamagramApp({
    Key? key,
    required this.appTheme,
  }) : super(key: key);

  final AppTheme appTheme;

  @override
  State<StreamagramApp> createState() => _StreamagramAppState();
}

class _StreamagramAppState extends State<StreamagramApp> {
  final _client = StreamFeedClient('dnr3fd6k83bt');
  late final appState = AppState(client: _client);

  late final feedBloc = FeedBloc(client: _client);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: appState,
      child: MaterialApp(
        title: 'Stream-agram',
        theme: widget.appTheme.lightTheme,
        darkTheme: widget.appTheme.darkTheme,
        themeMode: ThemeMode.dark,
        builder: (context, child) {
          return FeedProvider(
            bloc: feedBloc,
            child: child!,
          );
        },
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
