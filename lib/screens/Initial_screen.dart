import 'package:flutter/material.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {

  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  bool opacidade = true;
  bool iconeEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),//ocupa espaço ao lado do texto (facilidade do Material Design)
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(scrollDirection: Axis.vertical, children: const [
          Task(1,'assets/images/bike.webp','Aprender Dart',),
          Task(0,"assets/images/dash.png",'Musculamento'),
          Task(0,"assets/images/livro.jpg",'Musculamento'),
          Task(5,"assets/images/meditar.jpeg",
            'Chorar mas eu choro sorrindo ganhand o pouco e ganhando pouco assim vmaos nos sendo assim e legal olhar pro mudno todopara mano',),
          Task(3,"assets/images/livro.jpg",'Grego'),
          Task(3,"assets/images/livro.jpg",'Hebraico'),
          Task(3,"assets/images/livro.jpg",'Alemao'),
          Task(3,"assets/images/livro.jpg",'Ingles'),
          SizedBox(height: 80,)
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState((){
          opacidade = !opacidade;
          iconeEye = !iconeEye;
        });
      },
        child: iconeEye ? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined),),
    );
  }
}