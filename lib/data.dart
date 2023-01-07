











import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


class Data extends StatefulWidget {
  // const Data({super.key});
  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  // final String text;
  // Data(this.text);
  // print(text) ;
  // Data({required this.todos});
  @override
  Widget build(BuildContext context) {
    return                
                 ListView.builder(
                  // scrollDirection: Axis.vertical,
                  // itemCount: todos!.length,
                  itemBuilder: (context, i) {
                    return SingleChildScrollView(
                      child: ( ListTile(
                       
                       leading: CircleAvatar(backgroundColor: Colors.black,
                       child: Text("${i+1}" , style: TextStyle(color: Colors.white),),
                       ),
                      //  title: Text("${todos![i]}"),
                       trailing: Container(
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Icon(Icons.edit) ,
                          
                          Icon(Icons.delete) ,
                        ]),
                       ),
                                     
                      )
                                     
                                     
                      ),
                    ) ;
                  },
                 );
            
  }
  }