import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links3/uni_links.dart';
import 'package:untitled/Log-In/log_in_ui.dart';
import 'package:untitled/Password/reset_password.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    initDeepLink();
  }

  void initDeepLink() async {
    // Handle cold start
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) handleLink(initialLink);
    } catch (e) {
      _showError('Failed to process the initial link.');
    }

    // Handle opened while app is running
    _sub = linkStream.listen((String? link) {
      if (link != null) handleLink(link);
    }, onError: (err) {
      _showError('Failed to listen for deep links.');
    });
  }

  void handleLink(String link) {
    try {
      final uri = Uri.parse(link);

      if (uri.scheme == 'lupira' && uri.host == 'reset-password') {
        final segments = uri.pathSegments;

        if (segments.isNotEmpty) {
          final token = segments.first;

          _navigatorKey.currentState?.pushNamed(
            '/reset-password',
            arguments: token,
          );
        } else {
          _showError('Reset link is missing the token.');
        }
      } else {
        _showError('Invalid reset link format.');
      }
    } catch (e) {
      _showError('Failed to process the reset link.');
    }
  }

  void _showError(String message) {
    showDialog(
      context: _navigatorKey.currentContext!,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_navigatorKey.currentContext!),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: LogIn.routName,
      routes: {
        LogIn.routName: (context) => LogIn(),
        '/reset-password': (context) {
          final token = ModalRoute.of(context)?.settings.arguments as String;
          return ResetPassword(token: token);
        },
      },
    );
  }
}