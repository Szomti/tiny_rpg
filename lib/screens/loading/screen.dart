part of './library.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final ValueNotifier<int> progress = ValueNotifier(0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleAppStart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 64,
                  child: FittedBox(
                    child: CircularProgressIndicator(
                      color: AppTheme().foreground,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ValueListenableBuilder(
                  valueListenable: progress,
                  builder: (_, int value, __) {
                    return Text(
                      'Loading $value%',
                      style: TextStyle(
                        color: AppTheme().text,
                        fontSize: 24.0,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleAppStart() async {
    while (progress.value < 100) {
      await Future.delayed(
        const Duration(milliseconds: 25),
        () {
          progress.value += 1;
        },
      );
    }
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ActionsScreen()),
    );
  }
}
