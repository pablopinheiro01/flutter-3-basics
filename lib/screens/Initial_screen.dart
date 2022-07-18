import 'package:first_project_flutter_3_0/data/task_inherited.dart';
import 'package:first_project_flutter_3_0/screens/form_screen.dart';
import 'package:flutter/material.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: Container(),
          //ocupa espaço ao lado do texto (facilidade do Material Design)
          title: BarTitle(taskContext: context,),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 9, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (materialContext) => FormScreen(
                        taskContext: context,
                      )));
          //removido a opacidade do botao
          // setState((){
          //   opacidade = !opacidade;
          //   iconeEye = !iconeEye;
          // });
        },
        // child: iconeEye ? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined),),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BarTitle extends StatefulWidget {


  final BuildContext taskContext;
  double level = 0.0;
  double barProgressValue = 0.0;

  BarTitle({ Key? key, required this.taskContext}) : super(key: key);

  @override
  State<BarTitle> createState() => _BarTitleState();
}

class _BarTitleState extends State<BarTitle> {

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
             padding: const EdgeInsets.only(top: 15),
             child: Text(
                'Tarefas',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
           ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: widget.barProgressValue
                      // value: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Level: ${widget.level}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState((){
                      TaskInherited.of(widget.taskContext).valueOfLevel();
                      widget.barProgressValue =  TaskInherited.of(widget.taskContext).barProgressValue;
                      widget.level = TaskInherited.of(widget.taskContext).somaDeTodosOsNiveis;
                    });
                  },
                  child: Icon(Icons.refresh,),
                ),
              ],
            ),
          ),
        ]);
  }
}
