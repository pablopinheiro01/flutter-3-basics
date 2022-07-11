import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.red, width: 100, height: 100,),
              Container(
                color: Colors.blueAccent,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.blue, width: 100, height: 100,),
              Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(color: Colors.cyan, height: 50, width: 50,),
              Container(color: Colors.pinkAccent, height: 50, width: 50,),
              Container(color: Colors.purple, height: 50, width: 50,),
            ],
          ),
          Container(
            alignment: AlignmentDirectional.center,
            color:Colors.amber,
            height: 30,
            width: 3000,
            child: Text(
              'teste do texto',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                print("click no botao");
              },
              child: Text('Clica ai fi')
          ),
        ],
      ),
    );
  }
}
