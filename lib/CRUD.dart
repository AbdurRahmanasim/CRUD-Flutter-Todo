import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/edit.dart';
import 'package:http/http.dart' as http;




void main(){
  runApp( Crud()) ;
}



class Crud extends StatefulWidget {
  Crud({Key? key}) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {

  TextEditingController _todoname = new TextEditingController() ;
  TextEditingController _edittodo = new TextEditingController() ;

  List todos = [ ] ;

  var message = false ;


 addtodo() {
      if(_todoname.text != "" ){
        if(_todoname.text.length <= 10){
      setState(() {
        todos.insert(0 ,_todoname.text) ;
        message = false ;
      });
      Future senddata() async {
final String url = 'http://192.168.18.4:7070/createtodo' ;
final uri = Uri.parse(url);
// final dio = Dio() ;
var data= {
  "todo" : _todoname.text ,
  
};
_setheaders()=>{
  "Content-type" : "application/json" ,
  "Accept" :   "application/json" ,
};
// final response
final response = await  http.post(uri , body: jsonEncode(data)  , headers: _setheaders() );
final body = response.body ;
final json = jsonDecode(body) ;
// setState((){
    //  users = json;
// });
 print(json);

  

}
      
      }

      else{
        setState(() {
          message = true ;
        });
      }

        }
      _todoname.clear();
  }

  deleteall(){
    setState(() {
      todos.clear() ;
    });
  }
  boxshow(){
    return(
      showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text("Alert"),
      content: new Text("Text Length Should be less than 10"),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
)
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Todo")),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical ,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                    
                      child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
             width: 170.0,
             child: TextField(
            controller: _todoname,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                border: OutlineInputBorder(
                                 borderSide: BorderSide(
                        width: 1, 
                        style: BorderStyle.solid,
                    ),
                                  
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                hintText: "Enter Todo",
                                hintStyle: TextStyle(color: Colors.black)
                              ),
                            ),
            ), 
             SizedBox(width: 10,),
                        ElevatedButton(onPressed: addtodo,child: Text("Add"),),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: deleteall,child: Text("Delete"),),
                      ],
                    )
                    ,) ,
               SizedBox(height: 15,) ,


                    Container(
                      child: message ? Text("Text Length Should be less than 10" , style: TextStyle(color: Colors.red),) : Container(),
                    ),
               
               SizedBox(height: 15,) ,
               Divider(
              height: 1,
              color: Colors.black,
               ),
          
              //  ListView.builder(
              //   itemCount: todos.length,
              //   itemBuilder: (context, i) {
              //     return ListTile(
          
              //         leading: Text("${todos[i]}"),
                    
              //               // Text("${todos[i]}"),
              //               // Spacer(),
              //               // Icon(Icons.edit),
              //               // SizedBox(width: 10,) ,
              //               // Icon(Icons.delete),
          
                      
              //         ) ;
                  
                
               
              //  })
          
          
                  ],
                ),
              ),
               // SizedBox(height: 10,),
          


            // Data({todos: todos},) ,
       todos.isEmpty ?    Center(child: Text("No Data" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),) :
              
                 ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, i) {
                    return SingleChildScrollView(
                      child: ( ListTile(
                       
                       leading: CircleAvatar(backgroundColor: Colors.black,
                       child: Text("${i+1}" , style: TextStyle(color: Colors.white),),
                       ),
                       title: Text("${todos[i]}"),
                       trailing: Container(
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           InkWell(child: Icon(Icons.edit , color: Colors.black,), onTap: (){
                              showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text("Edit Text"),
      content: Container(
        height: 50,
        child: Column(
        
          children: [ 
            SizedBox(
               width: 170.0,
               child: TextField(
              controller: _edittodo,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  border: OutlineInputBorder(
                                   borderSide: BorderSide(
                          width: 1, 
                          style: BorderStyle.solid,
                      ),
                                    
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  hintText: "${todos[i]}",
                                  hintStyle: TextStyle(color: Colors.grey[350])
                                ),
                              ),
              ), 
                 
              
          ]
        ),
      ),
      actions: <Widget>[
         ElevatedButton(
          child: const Text("EDIT"),
          onPressed: () {
           setState(() {
            if(_edittodo.text != ""){
              if(_edittodo.text.length <= 10){
             todos[i] = _edittodo.text ;
             _edittodo.clear();
               setState(() {
        
          
        });
            Navigator.of(context).pop();
              }else{
                   boxshow() ;
              }
             }
             
           });

          },
        ),
      ],
    );
  },
);
                           },
                          
                           ) ,
                          
                           InkWell(child: Icon(Icons.delete , color: Colors.black,) , onTap: (){
                            setState(() {
                              
                              todos.removeAt(i);
                            });
                           },) ,


                        ]),
                       ),
                                     
                      )
                                     
                                     
                      ),
                    ) ;
                  },
                 ),
               
            ],
          ),
        ),
      );
    
  }
}