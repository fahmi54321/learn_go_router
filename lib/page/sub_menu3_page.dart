import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubMenu3 extends StatelessWidget {
  const SubMenu3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sub Menu 3',
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            'Kembali',
          ),
        ),
      ],
    );
  }
}
