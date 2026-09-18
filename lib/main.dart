import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/app_settings.dart';
import 'providers/network_monitor_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettings()),
        ChangeNotifierProvider(create: (_) => NetworkMonitorProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}
