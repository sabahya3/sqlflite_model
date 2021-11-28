class Note{
  int ?id;
  String? title;
  String? content;
  String ? dateTime;
  Note({this.id,this.title,this.content,this.dateTime});
  Note.fromMap(Map<String,dynamic>data){
    id=data['id'];
    title=data['title'];
    content=data['content'];
    dateTime=data['dateTime'];

  }
  Map<String,dynamic>toMap(){
    return{
'id':id,
'title':title,
'content':content,
'dateTime':dateTime
    };
  }
}