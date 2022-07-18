
import 'dart:math';

import 'package:flutter/material.dart';

import 'difficulty.dart';


class Task extends StatefulWidget {
  final String taskName;
  final String photo;
  final int dificuldade;

  Task(this.dificuldade, this.photo, this.taskName, {Key? key}) : super(key: key);

  int nivel = 0;

  int colorStart = 5;

  double levelCalculate = 0.0;

  bool update = false;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork(){
    return widget.photo.contains("http") ?  false :  true;
  }

  double calcValueLinearProgress(){
    widget.levelCalculate = widget.nivel > 0 && widget.dificuldade > 0 ? (widget.nivel/widget.dificuldade)/10 : 0.0;
    return widget.dificuldade > 0 ? widget.levelCalculate : 1;
  }

  void newColorUp(){
    widget.nivel++;
    if(((widget.nivel/widget.dificuldade)/10) > 1 ){
      widget.colorStart = Random().nextInt(Colors.primaries.length);
      widget.nivel = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            // color: Colors.blue,// nao pode ser utilizado junto com o decoration (ver documentacao)
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                color: Colors.primaries[widget.colorStart],
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: Colors.black26, //noa pode ser utilizado com decoration
                      width: 72,
                      height: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                          color: Colors.black26
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
                        child: assetOrNetwork() ? Image.asset(
                            widget.photo.toString(),
                            fit:BoxFit.cover
                        ) : Image.network(
                          widget.photo.toString(),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 200,
                            child: Text(
                              widget.taskName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis //formata texto mto grnde com tres pontos
                              ),
                            )),
                        Difficulty(dificultyLevel: widget.dificuldade),
                      ],
                    ),
                    Container(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState((){
                            newColorUp();
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text('UP', style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: calcValueLinearProgress(),//estrategia para subir a barra
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Nivel: ${widget.nivel}', style: TextStyle(color: Colors.white, fontSize: 16 ),),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

