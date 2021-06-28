import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TodoApp extends StatefulWidget {
  const TodoApp({ Key? key }) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

//Todo App made by Saleheen Noor

class _TodoAppState extends State<TodoApp> {

  var output = '';
  List<dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        backgroundColor: Colors.orange,
      ),
      body:
          list.length == 0 ? Center(
            child: Container(
              child: Text('You Have Not Added Any Todo Yet'),
            ),
          )
      :
        ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index){
                return Container(
                  height: 59,
                  margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                        topLeft:  const  Radius.circular(15.0),
                        topRight: const  Radius.circular(15.0),
                        bottomLeft:  const  Radius.circular(15.0),
                        bottomRight: const  Radius.circular(15.0),
                      )
                  ),
                  child: Center(
                    child: ListTile(
                      title: Text("${list[index]}"),
                      trailing: Container(
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(onTap: (){
                              setState(() {
                                list.removeAt(index);
                              });
                            },child: Icon(Icons.delete)),
                            GestureDetector(onTap: (){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text('Edit Todo'),
                                  content: TextField(
                                      controller: TextEditingController(text: "${list[index]}"),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Edit',

                                      ),

                                      onChanged: (value){
                                        output = value;
                                      }
                                  ),
                                  actions: [
                                Center(
                                child: SizedBox(
                                width: 200,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.orange),
                                      ),
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                        setState(() {
                                            list.replaceRange(index, index + 1, {output});
                                          });
                                      },
                                      child: Text('Update')),
                                ),
                                )
                                    // ElevatedButton(onPressed: (){
                                    //   Navigator.of(context).pop();
                                    //   setState(() {
                                    //     list.replaceRange(index, index + 1, {output});
                                    //   });
                                    // },
                                  ],
                                );
                              });
                            },child: Icon(Icons.edit)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          backgroundColor: Colors.orange,
          onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('Add Todo'),

                content: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Todo',
                      hintText: 'Enter your todo item'
                  ),
                  onChanged: (value){
                    output = value;
                  },
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.orange),
                        ),
                          onPressed: (){
                            Navigator.of(context).pop();
                              setState(() {
                                list.add(output);
                              });
                          },
                          child: Text('Add Todo')),
                    ),
                  )
                  // ElevatedButton(onPressed: (){
                  //   Navigator.of(context).pop();
                  //   setState(() {
                  //     list.add(output);
                  //   });
                  // }, child: Text('Add Todo'))
                ],
              );
            });
          },
          child: Center(
              child: Text('+',
                style: TextStyle(fontSize: 30),
              )
          )
      ),
    );
  }
}