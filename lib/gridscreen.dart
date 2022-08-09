import 'package:flutter/material.dart';

class TestGrid extends StatefulWidget {
  TestGrid({Key? key}) : super(key: key);

  @override
  State<TestGrid> createState() => _TestGridState();
}

class _TestGridState extends State<TestGrid> {
  int counter = 0;
  int optionSelect = 0;
  bool selected = false;
  Color color = Colors.grey;
  Icon icon = Icon(Icons.home);

  void checkOption(int index){
    optionSelect = index;
    setState(() {
      color = Colors.red;
    });
  }

  
Widget _buildGameBody() {
   
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
            crossAxisCount: 10,
          ),
          itemBuilder: _buildGridItems,
          itemCount: 10 * 10,
        ),
      ),
    ),
  ]);
}

  Widget _buildGridItems(BuildContext context, int index) {
  /*int gridStateLength = gridState.length;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);*/
  return GestureDetector(
    onTap: (){
       print(index);
      setState(() {
        optionSelect = index;
        //print(optionSelect+ index);
      });
    },
    child: Container(
      decoration: BoxDecoration(
        color: optionSelect == index? Colors.green : Colors.transparent,
        border: Border.all(color: Colors.black, width: 0.5)
      ),
      child: optionSelect == index? Icon(Icons.circle) : Text("")
    ),
  );
}


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game Body")),
      body: Column(
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
            crossAxisCount: 10,
          ),
          itemBuilder: _buildGridItems,
          itemCount: 10 * 10,
        ),
      ),
    ),
    InkWell(
      onTap: (){
        print("Guardar");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20)
        ),
        margin: const EdgeInsets.only(top: 20),
        height: 40, width: 120,
        child: const Center(
          child: Text("Save", style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20
        ),)),
      ),
    )
  ]),
    );
  }
}


