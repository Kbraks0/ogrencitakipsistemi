import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrencitakipsistemi/models/student.dart';

class StudentAdd extends StatefulWidget{

  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd>{
  var formKey = GlobalKey<FormState>();
  var student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci "),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children:<Widget> [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      )
    );
  }

 Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Kübra"),
      onSaved: (String value){
        student.firstName = value;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci soyadı", hintText: "KUŞ"),
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "95"),
      onSaved: (String value){
        student.grade = int.parse(value);
      },
    );
  }
  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}