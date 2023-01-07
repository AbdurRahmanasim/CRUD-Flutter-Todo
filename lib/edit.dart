









import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class Edit extends StatelessWidget {
  // const Edit({super.key});

   String text;

  Edit({required this.text});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                   width: 140.0,
                   child: TextField(
                
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
                                      hintText: "$text",
                                      hintStyle: TextStyle(color: Colors.black)
                                    ),
                                  ),
                  ), 
                   SizedBox(width: 10,),
                              ElevatedButton(onPressed: (){} ,child: Text("Edit"),),
                              
                            ],
                          
          ),
        ),
      ),
    );
  }
}