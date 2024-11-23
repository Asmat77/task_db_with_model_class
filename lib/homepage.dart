import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_task/dbhelper.dart';
import 'package:new_task/notemodel.dart';
import 'package:new_task/secondpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper db_Helper=DBHelper.getInstance;
  List<NoteModel> mData=[];



  @override
  void initState() {
    super.initState();
  }

  void getNotes()async{
    mData=await db_Helper.fetchNote();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: GridView.builder(
          itemCount: mData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                crossAxisCount: 2), itemBuilder: (context,index){
          return Container(
            color: Colors.blue,
            child: Column(
              children: [
                Text(mData[index].title),
                SizedBox(height: 10,),
                Text(mData[index].desc),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTwo()));
      },child: Icon(Icons.add),),
    );
  }
}
