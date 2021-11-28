import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesy/getx_controller/controller.dart';

import 'package:notesy/models/notes.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote();

  @override
  Widget build(BuildContext context) {

    TextEditingController title=TextEditingController();
      TextEditingController content=TextEditingController();
        final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar:AppBar(title: Text("Add new note"),),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (Value){
                      if(Value==null||Value=='')
                  {
                    Get.snackbar("Warning", "You can't leave title empty",snackPosition: SnackPosition.BOTTOM,colorText: Colors.black,) ;
                  return "You Cant Leave the  title of the note empty";
                  }
                  
                    },
                    controller: title,
                    decoration: InputDecoration(prefixIcon: Icon(Icons.auto_fix_normal_outlined,color: Colors.teal,size: 30,),labelText: "Title",border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide(color:Colors.blue,width: 3)),disabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide(color:Colors.blue,width: 3)) ),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                     validator: (Value){
                      if(Value==null||Value=='')
                  {
                        Get.snackbar("Warning", "You can't leave title empty",snackPosition: SnackPosition.BOTTOM,colorText: Colors.black,) ;
                  return "You Cant Leave the  title of the note empty";
                  }
                  
                    },
                    controller: content,
                    maxLines: 5,
                    decoration: InputDecoration(
                      
                      prefixIcon: Icon(Icons.content_paste,color: Colors.teal,size: 30,),labelText: "Content",border: OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide(color:Colors.blue,width: 3)),disabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(15),borderSide: BorderSide(color:Colors.blue,width: 3))),
                  ),
                ),
                SizedBox(height: 50,),
                FloatingActionButton.extended(onPressed: ()async{
          
               MyController controller=Get.put(MyController());

                 var formState=_formKey.currentState;
                 if(formState!.validate()==true){

                 await controller.addNote( Note(id: null,title: title.text,content: content.text,dateTime: DateTime.now().toString()));
                 await controller.getNotes();
                 Get.snackbar("Messege", "Added Successfully",snackPosition: SnackPosition.BOTTOM,colorText: Colors.black,);}
                 else {Get.snackbar("Warning", "Please, enter any data",snackPosition: SnackPosition.BOTTOM); }
             
                }, label: Text("Add",style: TextStyle(fontSize: 20),),icon: Icon(Icons.add,size: 30,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}