import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class NoteContent extends StatelessWidget {
  const NoteContent();

  @override
  Widget build(BuildContext context) {
    MyController controller=Get.put(MyController());
    return Scaffold(
      appBar: AppBar(title: Text("${controller.myNotes[controller.currentIndex.toInt()].title}"),centerTitle: true,),
      body: Container(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),height: MediaQuery.of(context).size.height,width: double.infinity,decoration: BoxDecoration(color: Colors.blue.withOpacity(0.3),border: Border.all(color: Colors.teal,width: 5),borderRadius: BorderRadius.circular(15)),margin: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 20),child:  SingleChildScrollView(child: SingleChildScrollView(child:Text("${controller.myNotes[controller.currentIndex.toInt()].content}",textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),),), )
      
      
    
    );
  }
}