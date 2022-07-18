import 'package:first_project_flutter_3_0/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  List<Task> taskList = [
    Task(1,'assets/images/bike.webp','Aprender Dart',),
    Task(0,"assets/images/dash.png",'Musculamento'),
    Task(0,"assets/images/livro.jpg",'Musculamento'),
    Task(5,"assets/images/meditar.jpeg",
      'Correr 5km por dia para competicao',),
    Task(3,"assets/images/livro.jpg",'Grego'),
    Task(3,"assets/images/livro.jpg",'Hebraico'),
    Task(3,"assets/images/livro.jpg",'Alemao'),
    Task(3,"assets/images/livro.jpg",'Ingles'),
  ];

  double barProgressValue = 0.0;
  double somaDeTodosOsNiveis = 0.0;

  void newTask(String name, String photo, int difficult){
    taskList.add(Task(difficult, photo, name));
  }

  double calcTotalDifficulty(){
    double value = 0.0;
    for(Task t in taskList){
      value += t.nivel;
    }
    print("valor total da dificuldade: ${value}");
    return value;
  }

  double calcTotalStars(){
    double value = 0.0;
    for(Task t in taskList){
      value += t.dificuldade;
    }
    print("valor total das estrelas: ${value}");
    return value;
  }

  double calcTotalLevels(){
    double value = 0.0;
    for(Task t in taskList){
      value += t.levelCalculate;
    }
    print("valor total dos levels: ${value}");
    return value;
  }

  void valueOfLevel(){

    barProgressValue = calcTotalDifficulty() > 0 ? (calcTotalLevels()/calcTotalStars()) : 0;

    somaDeTodosOsNiveis = (calcTotalLevels()*calcTotalStars()).roundToDouble();

    print("calculo feito: ${(calcTotalLevels()/calcTotalStars())}");


  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length ; //compara os dados para notificar todos que foi alterado
  }
}
