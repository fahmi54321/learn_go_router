import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:learn_go_router/constants.dart';
import 'package:learn_go_router/transition/bar_transition.dart';
import 'package:learn_go_router/transition/rail_transition.dart';
import 'package:learn_go_router/widget/navigation_bars.dart';

class HomePage extends StatefulWidget {
  final Widget content;
  const HomePage({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final CurvedAnimation railAnimation;
  late final ReverseAnimation barAnimation;
  late final AnimationController controller;

  bool isLargeScreen = false;
  bool isInitializedController = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500 * 2),
      value: 0,
      vsync: this,
    );

    railAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0),
    );

    barAnimation = ReverseAnimation(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    final AnimationStatus status = controller.status;

    if (width > 1000) {
      if (width > 1500) {
        isLargeScreen = true;
      } else {
        isLargeScreen = false;
      }

      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        controller.forward();
      }
    } else {
      isLargeScreen = false;
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        controller.reverse();
      }
    }
    if (!isInitializedController) {
      isInitializedController = true;
      controller.value = width > 1000 ? 1 : 0;
    }
  }

  void onDestinationSelected(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/menu1');
        break;
      case 1:
        GoRouter.of(context).go('/menu2');
        break;
      case 2:
        GoRouter.of(context).go('/menu3');
        break;
    }
  }

  int selectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/menu1')) {
      return 0;
    }
    if (location.startsWith('/menu2')) {
      return 1;
    }
    if (location.startsWith('/menu3')) {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          body: Row(
            children: [
              RailTransition(
                animation: railAnimation,
                backgroundColor: colorScheme.surface,
                child: NavigationRail(
                  extended: isLargeScreen,
                  destinations: railMenu,
                  selectedIndex: selectedIndex(context),
                  onDestinationSelected: (index) {
                    onDestinationSelected(index, context);
                  },
                ),
              ),
              Expanded(
                child: widget.content,
              ),
            ],
          ),
          bottomNavigationBar: BarTransition(
            animation: barAnimation,
            backgroundColor: colorScheme.surface,
            child: NavigationBars(
              onSelectItem: (index) {
                onDestinationSelected(index, context);
              },
              selectedIndex: selectedIndex(context),
            ),
          ),
        );
      },
    );
  }
}
