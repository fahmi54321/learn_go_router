import 'package:flutter/material.dart';

final List<NavigationRailDestination> railMenu = menuAll
    .map(
      (destination) => NavigationRailDestination(
        icon: Tooltip(
          message: destination.label,
          child: destination.icon,
        ),
        selectedIcon: Tooltip(
          message: destination.label,
          child: destination.selectedIcon,
        ),
        label: Text(destination.label),
      ),
    )
    .toList();

const List<NavigationDestination> menuAll = [
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.home_outlined),
    label: 'Menu 1',
    selectedIcon: Icon(Icons.home),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.task_outlined),
    label: 'Menu 2',
    selectedIcon: Icon(Icons.task),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.chat_outlined),
    label: 'Menu 3',
    selectedIcon: Icon(Icons.chat),
  ),
];
