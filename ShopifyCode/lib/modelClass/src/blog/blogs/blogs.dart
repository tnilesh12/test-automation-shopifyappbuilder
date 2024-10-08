

import '../blog.dart';

class Blogs {
   List<Blog>? blogList;

   Blogs({this.blogList}) ;

   Blogs.fromJson(Map<String, dynamic> json)
   {
blogList=_getBlogList(json);
   }
   Map<String,dynamic> toJson()=>
   {
    'blogList':'$_getBlogList'
   };
  

  static Blogs fromGraphJson(Map<String, dynamic> json) {
    return Blogs(blogList: _getBlogList(json));
  }

  static List<Blog> _getBlogList(Map<String, dynamic> json) {
    List<Blog> blogList = [];
    json['edges']
        ?.forEach((blog) => blogList.add(Blog.fromGraphJson(blog ?? const {})));
    return blogList;
  }
}
