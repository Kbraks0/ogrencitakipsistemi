import 'package:flutter/material.dart';
import 'package:ogrencitakipsistemi/models/student.dart';
import 'package:ogrencitakipsistemi/screens/student_add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Kübra", "KUŞ", 95),
    Student.withId(2, "Ahmet", "TAŞTEPE", 25),
    Student.withId(3, "Şerife", "KOCAOĞLU", 45)
  ];

  Student selectedStudent = Student.withId(0, "Hiç Kimse ", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Takip Sistemi"),
      ),
      body: buildBody()
    );
  }

  Widget buildBody (){
    return Column(
      children: <Widget> [
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(students[index].firstName + " " + students[index].lastName ),
                subtitle: Text("Sınavdan aldığı not :" + students[index].grade.toString()+"["+students[index].getStatus+"]"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg"),
              ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: (){
                  setState(() {
                    this.selectedStudent = students[index];
                  });

                  print(this.selectedStudent.firstName);
                },
                onLongPress: (){
                  print("Uzun Basıldı");
                },
              );
            }),
        ),
        Text("Seçili öğrenci " + selectedStudent.firstName),
        Row(
          children:<Widget> [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children:<Widget> [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Yeni Öğrenci")
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),

            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:RaisedButton(
                color: Colors.black12,
                child: Row(
                  children:<Widget> [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Güncelle")
                  ],
                ),
                onPressed: (){
                  print("Güncelle");
                },
              ),

            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children:<Widget> [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Sil")
                  ],
                ),
                onPressed: (){
                  print("Sil");
                },
              ),

            )
          ],
        )

      ],
    );

  }

  buildStatusIcon(int grade) {
    if (grade>=50){
      return Icon(Icons.done);
    }else if (grade>=40){
      return Icon(Icons.album);
    }else{
      return Icon(Icons.clear);
    }
  }
}
