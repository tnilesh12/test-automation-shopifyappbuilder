// 

// part 'comment.freezed.dart';
// part 'comment.g.dart';


class Comment  {
  
   String? email;
    String? name;
    String? content;
    String? contentHtml;
    String? id;
   Comment({
    String? email,
    String? name,
    String? content,
    String? contentHtml,
    String? id,
  });

   Comment.fromJson(Map<String, dynamic> json) 
   {
    email=json['email'];
    name=json['name'];
    content=json['content'];
    contentHtml=json['contentHtml'];
    id=json['id'];
   }
   Map<String,dynamic> toJson()=>
   {
    'email':'$email',
    'name':'$name',
    'content':'$content',
    'contentHtml':'$contentHtml',
    'id':'$id'
   };


  static Comment fromGraphJson(Map<String, dynamic> json) {
    return Comment(
        email: ((json['node'] ?? const {})['author'] ?? const {})['email'],
        name: ((json['node'] ?? const {})['author'] ?? const {})['name'],
        content: (json['node'] ?? const {})['content'],
        contentHtml: (json['node'] ?? const {})['contentHtml'],
        id: (json['node'] ?? const {})['id']);
  }
 
}
