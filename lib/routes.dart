import 'package:flutter/material.dart';

import 'screens/activity_counter_screen.dart';
import 'screens/activity_network_monitor_screen.dart';
import 'screens/activity_notes_screen.dart';
import 'screens/home_dashboard.dart';
import 'screens/settings_screen.dart';

/// Metadata definition for activities included in this compilation project.
class ActivityItem {
  const ActivityItem({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.route,
    required this.tags,
  });

  final String number;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final String route;
  final List<String> tags;
}

/// Central routing configuration and compilation activities catalog.
class AppRoutes {
  static const String home = '/';
  static const String activityOne = '/activity/counter';
  static const String activityTwo = '/activity/notes';
  static const String activityThree = '/activity/network-monitor';
  static const String settings = '/settings';

  // Compatibility aliases
  static const String counterActivity = activityOne;
  static const String notesActivity = activityTwo;
  static const String networkMonitorActivity = activityThree;

  /// Compilation catalog of all activity screens in the project.
  static const List<ActivityItem> compilationActivities = [
    ActivityItem(
      number: 'Activity 1',
      title: 'Counter Activity',
      subtitle: 'Local state management with increment, decrement, and reset.',
      description:
          'An interactive counter demonstrating StatefulWidget lifecycle and isolated local state.',
      icon: Icons.exposure_plus_1,
      route: activityOne,
      tags: ['StatefulWidget', 'Local State', 'Buttons'],
    ),
    ActivityItem(
      number: 'Activity 2',
      title: 'Notes Activity',
      subtitle: 'Dynamic list management with interactive text input.',
      description:
          'A dynamic notepad showcasing TextEditingController, Form inputs, and responsive ListView.',
      icon: Icons.notes_outlined,
      route: activityTwo,
      tags: ['TextEditingController', 'ListView', 'Forms'],
    ),
    ActivityItem(
      number: 'Activity 3',
      title: 'Network Monitor',
      subtitle:
          'Real-time stream listener, resilient request queueing & graceful recovery.',
      description:
          'Monitors active connection interfaces (Wi-Fi, Cellular, Offline), queues long-running requests during handover or disconnects, and auto-retries upon reconnection.',
      icon: Icons.sensors_rounded,
      route: activityThree,
      tags: ['connectivity_plus', 'Streams', 'Queuing', 'Auto-Recovery'],
    ),
  ];

  /// Standard route builder map.
  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const HomeDashboard(),
        activityOne: (_) => const ActivityCounterScreen(),
        activityTwo: (_) => const ActivityNotesScreen(),
        activityThree: (_) => const ActivityNetworkMonitorScreen(),
        settings: (_) => const SettingsScreen(),
      };

  /// Dynamic route generator with fallback 404 handler.
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final builder = routes[routeSettings.name];
    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: routeSettings,
      );
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Route Not Found')),
        body: Center(
          child: Text('No route defined for "${routeSettings.name}"'),
        ),
      ),
      settings: routeSettings,
    );
  }
}
