part of './library.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                  _createTile(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Expanded(child: Column()),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: AppTheme().text),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createTile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppTheme().foreground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Text('<Action>', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
