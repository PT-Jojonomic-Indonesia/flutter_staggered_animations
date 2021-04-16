import 'dart:async';

import 'package:flutter/material.dart';

/// Automatically rebuild [child] widget after the given [duration]
class AutoRefresh extends StatefulWidget {
  final Duration duration;
  final Widget child;

  AutoRefresh({
<<<<<<< HEAD
    Key? key,
    required this.duration,
    required this.child,
  }) : super(key: key);
=======
    Key key,
    @required this.duration,
    @required this.child,
  })
      : assert(duration != null),
        super(key: key);
>>>>>>> 26a3ca24325a00de978e9fa94d15c0f9d6d1f4ee

  @override
  _AutoRefreshState createState() => _AutoRefreshState();
}

class _AutoRefreshState extends State<AutoRefresh> {
  int? keyValue;
  ValueKey? key;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    keyValue = 0;
    key = ValueKey(keyValue);

    _recursiveBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }

  void _recursiveBuild() {
    _timer = Timer(
      widget.duration,
          () {
        setState(() {
          keyValue = keyValue! + 1;
          key = ValueKey(keyValue);
          _recursiveBuild();
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
