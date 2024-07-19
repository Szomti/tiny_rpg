part of '../library_basic.dart';

class BasicScaffold extends StatelessWidget {
  final Widget child;

  const BasicScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().background,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
