import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import '../widgets/note_content.dart';
import 'new_note.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen();

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  MyController controller=Get.put(MyController());
  @override
  void initState() {
    Get.find<MyController>().getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        actions: [  GetBuilder<MyController>(
            builder: (controller) =>  Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                iconSize: 30,
                onPressed: () => controller.toggleDarkMode() ,
                icon: Icon(
                  controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
              ),
            ))
        ],
        centerTitle: true,
        title: Text("My Notes"),
      ),

      body:Obx(()=>
          ListView.builder(
            itemBuilder: (context,i){

              return Container(padding: EdgeInsets.only(top: 20),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:i%2==0?Colors.purple.withOpacity(0.7):Colors.blue.withOpacity(0.9)),margin: EdgeInsets.symmetric(vertical: 30,horizontal: 25),height: 200,width: 200,child: ListTile(onTap: (){
                controller.getCurrentIndex(i);
                Get.to(NoteContent());
              },leading: CircleAvatar(child: Text("${i+1}"),),subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Container(
                  margin:EdgeInsets.only(top:30,bottom: 5),
                  child: Text("Date and Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ),


                Text("  ${DateTime.parse(controller.myNotes[i].dateTime!).hour==12?12:DateTime.parse(controller.myNotes[i].dateTime!).hour-12} : "+"${DateTime.parse(controller.myNotes[i].dateTime!).minute} : "+"${DateTime.parse(controller.myNotes[i].dateTime!).second} ",style: TextStyle(fontSize: 17),),
                SizedBox(height: 5,),
                Text("  ${DateTime.parse(controller.myNotes[i].dateTime!).year} - "+"${DateTime.parse(controller.myNotes[i].dateTime!).month} - "+"${DateTime.parse(controller.myNotes[i].dateTime!).day} ",style: TextStyle(fontSize: 17))




              ],),title: Text("Title : ${controller.myNotes[i].title}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),trailing: Padding(
                padding: EdgeInsets.only(top: 35),
                child: GestureDetector(child:Icon(Icons.delete,size: 40,color: Colors.red,),onTap:  (){
                  controller.deleteNotes(controller.myNotes[i]);
                },),
              ),));

            },itemCount: controller.myNotes.length,),
      ),


      floatingActionButton: FloatingActionButton.extended(heroTag: "2",onPressed: (){
        Get.to(AddNewNote(),transition: Transition.fade,curve: Curves.easeInCubic,duration: Duration(milliseconds: 500));
      }, label: Text("Add new Note",style: TextStyle(fontSize: 18),),icon: Icon(Icons.note_alt_outlined,size: 30,),),
    );
  }
}
