import 'package:flutter/material.dart';
import 'package:new_task/dbhelper.dart';
import 'package:new_task/homepage.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  DBHelper db_Helper=DBHelper.getInstance;
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: double.infinity,
      width: double.infinity,
        child: Column(
          children: [
            Text("Add Note"),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green,strokeAlign: 2),
                  borderRadius: BorderRadius.circular(11),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue,),
                  borderRadius: BorderRadius.circular(11),
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green,strokeAlign: 1),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,),
                    borderRadius: BorderRadius.circular(11),
                  )
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(onPressed: (){}, child: Text("Add")),
                SizedBox(width: 10,),
                OutlinedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }, child: Text("Cancel")),
              ],
            )

          ],
        ),
      ),
    );
  }
}
