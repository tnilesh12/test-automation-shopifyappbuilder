

// part 'author_v_2.freezed.dart';
// part 'author_v_2.g.dart';


class AuthorV2  {
      String? bio;
      String? email;
      String? firstName;
      String? lastName;
      String? name;
   AuthorV2(
      {
        this.bio,
      this.email,
      this.firstName,
      this.lastName,
      this.name
      }) ;

   AuthorV2.fromJson(Map<String, dynamic> json)
   {
    bio=json['bio'];
     email=json['email'];
      firstName=json['firstName'];
       lastName=json['lastName'];
        name=json['name'];
   }
   Map<String,dynamic> toJson()=>
   {
'bio':'$bio',
'email':'$email',
'firstName':'$firstName',
'lastName':'$lastName',
'name':'$name',
   };
  
}
