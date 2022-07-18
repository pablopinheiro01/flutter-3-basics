
import 'package:first_project_flutter_3_0/data/task_inherited.dart';
import 'package:first_project_flutter_3_0/screens/Initial_screen.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {

 final BuildContext taskContext;

 const FormScreen({required this.taskContext, Key? key,}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value){
      if( value != null && value != ""){
        if(int.parse(value) > 5 || int.parse(value) < 1){
          return true;
        }
      }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value){
                        if(valueValidator(value) ){
                          return 'Insira um nome';
                        }
                          return null;

                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value){
                        if(!difficultyValidator(value)){
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if(valueValidator(value)){
                          return 'Insira uma url pra imagem';
                        }
                          return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text){
                        setState((){ //atualiza a tela mesmo sem a necessidade de passagem de parametro

                        });
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        //https://cdn.ome.lt/qnK3hf0_08-cjuoRDb98LkEg3Do=/1200x630/smart/extras/conteudos/darth-vader-fortnite.jpg
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                            return Image.asset('assets/images/nophoto.jpg', fit: BoxFit.cover,);
                        },
                      ),

                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){//valida o estado do formulario
                      // print(nameController.text);
                      // print( int.parse(difficultyController.text));
                      // print(imageController.text);
                      TaskInherited.of(widget.taskContext)
                          .newTask(nameController.text, imageController.text,int.parse(difficultyController.text));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Criando nova tarefa...'),),);
                      Navigator.pop(context);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => InitialScreen())); //adiciona a tela na pilha
                    }
                  }, child: Text('Adicionar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
