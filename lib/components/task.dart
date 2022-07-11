
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

import 'difficulty.dart';


class Task extends StatefulWidget {
  final String taskName;
  final String photo;
  final int dificuldade;

  const Task(this.dificuldade, this.photo, this.taskName, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  int nivel = 0;

  int colorStart = 5;


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
                color: Colors.primaries[colorStart],
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
                        child: Image.asset(
                            widget.photo.toString(),
                            fit:BoxFit.cover
                        ),
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
                            nivel++;
                            if(((nivel/widget.dificuldade)/10) >= 1 ){
                              colorStart = Random().nextInt(Colors.primaries.length);
                              nivel = 0;
                            }
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
                        value:widget.dificuldade > 0 ? (nivel/widget.dificuldade)/10 : 1, //estrategia para subir a barra
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Nivel: $nivel', style: TextStyle(color: Colors.white, fontSize: 16 ),),
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

