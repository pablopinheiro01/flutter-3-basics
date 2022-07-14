import 'package:first_project_flutter_3_0/data/task_inherited.dart';
import 'package:first_project_flutter_3_0/screens/form_screen.dart';
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
      body: ListView(scrollDirection: Axis.vertical,
          children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 9, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (materialContext) => FormScreen(taskContext: context,)));
        //removido a opacidade do botao
        // setState((){
        //   opacidade = !opacidade;
        //   iconeEye = !iconeEye;
        // });
      },
        // child: iconeEye ? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined),),
        child: const Icon(Icons.add),),
    );
  }
}