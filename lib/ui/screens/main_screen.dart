import 'package:field_fox/ui/screens/history_screen.dart';
import 'package:field_fox/ui/screens/home_screen.dart';
import 'package:field_fox/ui/screens/profile_screen.dart';
import 'package:field_fox/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home_rounded, size: 28),
            title: "Home",
            activeForegroundColor: Theme.of(context).colorScheme.primary,
            inactiveForegroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        PersistentTabConfig(
          screen: ChatScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 26),
            title: "Chat",
            activeForegroundColor: Theme.of(context).colorScheme.primary,
            inactiveForegroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        PersistentTabConfig(
          screen: HistoryScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.calendar_month_rounded, size: 26),
            title: "History",
            activeForegroundColor: Theme.of(context).colorScheme.primary,
            inactiveForegroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        PersistentTabConfig(
          screen: ProfileScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person_outline_rounded, size: 28),
            title: "Profile",
            activeForegroundColor: Theme.of(context).colorScheme.primary,
            inactiveForegroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withValues(alpha: 0.12),
              blurRadius: 8.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      navBarOverlap: const NavBarOverlap.full(),
    );
  }
}
