import 'package:flutter/material.dart';

/// Controla mostrar/ocultar el menú según dirección del scroll (estilo Facebook).
class FloatingNavBarScrollController {
  FloatingNavBarScrollController();

  final ValueNotifier<bool> isVisible = ValueNotifier(true);

  static const double _deltaThreshold = 4.0;

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta;
      if (delta == null) return false;
      if (delta > _deltaThreshold) {
        if (isVisible.value) isVisible.value = false;
      } else if (delta < -_deltaThreshold) {
        if (!isVisible.value) isVisible.value = true;
      }
    }

    if (notification.metrics.pixels <= 0 && !isVisible.value) {
      isVisible.value = true;
    }

    return false;
  }

  void show() => isVisible.value = true;

  void dispose() {
    isVisible.dispose();
  }
}

class FloatingNavBarScrollScopeInherited extends InheritedWidget {
  const FloatingNavBarScrollScopeInherited({
    required this.controller,
    required super.child,
  });

  final FloatingNavBarScrollController controller;

  static FloatingNavBarScrollController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FloatingNavBarScrollScopeInherited>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(FloatingNavBarScrollScopeInherited oldWidget) =>
      controller != oldWidget.controller;
}

/// Envuelve la pantalla que usa [FloatingNavBar] (Stack + scroll + menú).
class FloatingNavBarScrollScope extends StatefulWidget {
  const FloatingNavBarScrollScope({super.key, required this.child});

  final Widget child;

  @override
  State<FloatingNavBarScrollScope> createState() =>
      _FloatingNavBarScrollScopeState();
}

class _FloatingNavBarScrollScopeState extends State<FloatingNavBarScrollScope> {
  late final FloatingNavBarScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FloatingNavBarScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingNavBarScrollScopeInherited(
      controller: _controller,
      child: widget.child,
    );
  }
}

/// Colócalo alrededor del área con scroll (Column + SingleChildScrollView, etc.).
class FloatingNavBarScrollListener extends StatelessWidget {
  const FloatingNavBarScrollListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final controller = FloatingNavBarScrollScopeInherited.maybeOf(context);
    assert(
      controller != null,
      'FloatingNavBarScrollListener requiere un FloatingNavBarScrollScope padre.',
    );

    return NotificationListener<ScrollNotification>(
      onNotification: controller!.handleScrollNotification,
      child: child,
    );
  }
}
