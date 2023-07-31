import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu1Page extends StatelessWidget {
  const Menu1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Menu 1',
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Router.neglect(context, () {
              context.go('/menu1/subMenu1');
            });
          },
          child: const Text(
            'Ke Sub Menu 1',
          ),
        ),
      ],
    );
  }
}
