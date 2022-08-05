import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: _buildGameBody(),
      ),
    );
  }
}

Widget _buildGameBody() {
   
  int gridStateLength = gridState.length;
  return Column(
    children: <Widget>[
    AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0)
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridStateLength,
          ),
          itemBuilder: _buildGridItems,
          itemCount: gridStateLength * gridStateLength,
        ),
      ),
    ),
  ]);
}

Widget _buildGridItems(BuildContext context, int index) {
  int gridStateLength = gridState.length;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);
  return GestureDetector(
    onTap: () => _buildGridItem(x, y),
    child: GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.black, width: 0.5)
        ),
        child: Center(
          child: _buildGridItem(x, y),
        ),
      ),
    ),
  );
}


Widget _buildGridItem(int x, int y) {
  switch (gridState[x][y]) {
    case '':
      return Text('');
      break;
    case 'P1':
      return Container(
        color: Colors.blue,
      );
      break;
    case 'P2':
      return Container(
        color: Colors.yellow,
      );
      break;
    case 'T':
      return Icon(
        Icons.terrain,
        size: 40.0,
        color: Colors.red,
      );
      break;
    case 'B':
      return Icon(Icons.remove_red_eye, size: 40.0);
      break;
    default:
      return Text(gridState[x][y].toString());
  }
}

List<List<String>> gridState = [
  ['', 'T', '', '', '', '', '', 'P2'],
  ['', '', '', 'T', '', '', '', ''],
  ['B', 'T', '', '', '', 'B', '', ''],
  ['', '', '', 'B', '', '', '', 'T'],
  ['', '', 'T', '', '', 'T', '', ''],
  ['', '', '', '', '', '', '', 'B'],
  ['', '', '', '', 'T', '', '', ''],
  ['P1', '', '', '', '', '', 'T', ''],
];