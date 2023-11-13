import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController directionController = TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
            child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value){
                if (value==null || value.isEmpty){
                  return "Obligatorio";
                }
              },
            ),
            TextFormField(
              controller: lastnameController,
              decoration: InputDecoration(
                labelText: 'Apellido',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value){
                if (value==null || value.isEmpty){
                  return "Obligatorio";
                }
              },
            ),
            TextFormField(
              controller: mailController,
              decoration: InputDecoration(
                labelText: 'Correo',
                prefixIcon: Icon(Icons.mail),
                
              ),
              validator: (String? value){
                 if (value==null || value.isEmpty){
                  return "Obligatorio";
                }
                final RegExp mail=
                  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if(!mail.hasMatch(value)){
                  return "Correo no válido";
                }
                return null;
              },
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: 'Fecha de nacimiento',
                prefixIcon: Icon(Icons.calendar_month),
              ),
               validator: (String? value){
                if (value==null || value.isEmpty){
                  return "Obligatorio";
                }
                return null;
              },
              onTap:()async{
                final DateTime? select=await showDatePicker(context: context,
                 initialDate: DateTime.now(),
                  firstDate: DateTime(2005),
                   lastDate: DateTime.now(),
                   );
                   if (select!=null){
                    setState(() {
                      ageController.text=select.toString().split(' ')[0];
                    });
                   }

              }
            ),
            TextFormField(
              controller: directionController,
              decoration: InputDecoration(
                labelText: 'Direccion',
                prefixIcon: Icon(Icons.numbers),
              ),
              validator: (String? value){
                if (value==null || value.isEmpty){
                  return "Obligatorio";
                }
              },
            ),
            MaterialButton(onPressed: (){

                if(formKey.currentState!.validate()){
                  print('El forms se completó de manera correcta');
                }
            }, 
            child: const Text('Validar'))
          ],
        )),
      ),
    );
  }
  
}
