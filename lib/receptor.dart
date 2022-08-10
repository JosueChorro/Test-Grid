import 'package:flutter/material.dart';

class Receptor extends StatefulWidget {

  final int indexer;

  Receptor(this.indexer);

  @override
  State<Receptor> createState() => _ReceptorState();
}

class _ReceptorState extends State<Receptor> {
   
Color color = Colors.grey;


   Widget _buildGridItems(BuildContext context, int index) {
  /*int gridStateLength = gridState.length;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);*/
  return Container(
    decoration: BoxDecoration(
      color: widget.indexer == index? Colors.green : Colors.transparent,
      border: Border.all(color: Colors.black, width: 0.5)
    ),
    child: widget.indexer == index? Icon(Icons.circle) : Text("")
  );
}

  //const Receptor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(title: const Text("Game Body"), backgroundColor: Colors.black,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('La zona de bateo fue en la celda:'+ " " +widget.indexer.toString(), style: const TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold
        ),),
      ),
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
    
  ]),
    );
  }
}