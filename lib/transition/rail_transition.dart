// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learn_go_router/animation/offset_animation.dart';
import 'package:learn_go_router/animation/size_animation.dart';

class RailTransition extends StatefulWidget {
  const RailTransition({
    Key? key,
    required this.child,
    required this.backgroundColor,
    required this.animation,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColor;
  final Animation<double> animation;

  @override
  State<RailTransition> createState() => _RailTransitionState();
}

class _RailTransitionState extends State<RailTransition> {
  late Animation<Offset> offsetAnimation;
  late Animation<double> widthAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // The animations are only rebuilt by this method when the text
    // direction changes because this widget only depends on Directionality.
    final bool ltr = Directionality.of(context) == TextDirection.ltr;

    widthAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(SizeAnimation(widget.animation));

    offsetAnimation = Tween<Offset>(
      begin: ltr ? const Offset(-1, 0) : const Offset(1, 0),
      end: Offset.zero,
    ).animate(OffsetAnimation(widget.animation));
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
          widthFactor: widthAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
