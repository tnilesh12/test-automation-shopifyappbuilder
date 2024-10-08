
import '../page.dart';



class Pages  {
   List<Pagess>? pageList;
   Pages({ this.pageList});
 
   Pages.fromJson(Map<String, dynamic> json)
   {
    pageList=_getPageList(json);
   }
   Map<String,dynamic> toJson()=>
   {
'pageList':'$_getPageList'
   };
  

  static Pages fromGraphJson(Map<String, dynamic> json) {
    return Pages(pageList: _getPageList(json));
  }

  static List<Pagess> _getPageList(Map<String, dynamic> json) {
    List<Pagess> pageList = [];
    json['edges']
        ?.forEach((blog) => pageList.add(Pagess.fromGraphJson(blog ?? const {})));
    return pageList;
  }
}
