import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu3Page extends StatelessWidget {
  const Menu3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Menu 3',
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Router.neglect(context, () {
              context.go('/menu3/subMenu3');
            });
          },
          child: const Text(
            'Ke Sub Menu 3',
          ),
        ),
      ],
    );
  }
}
