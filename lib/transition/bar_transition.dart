// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learn_go_router/animation/offset_animation.dart';
import 'package:learn_go_router/animation/size_animation.dart';

class BarTransition extends StatefulWidget {
  const BarTransition({
    Key? key,
    required this.backgroundColor,
    required this.child,
    required this.animation,
  }) : super(key: key);

  final Color backgroundColor;
  final Widget child;
  final Animation<double> animation;

  @override
  State<BarTransition> createState() => _BarTransitionState();
}

class _BarTransitionState extends State<BarTransition> {
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> heightAnimation;

  @override
  void initState() {
    super.initState();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(OffsetAnimation(widget.animation));

    heightAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(SizeAnimation(widget.animation));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          heightFactor: heightAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
