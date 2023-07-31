import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu2Page extends StatelessWidget {
  const Menu2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Menu 2',
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Router.neglect(context, () {
              context.go('/menu2/subMenu2');
            });
          },
          child: const Text(
            'Ke Sub Menu 2',
          ),
        ),
      ],
    );
  }
}
