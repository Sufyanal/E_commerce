class register{
   String name = '';
  String emial='';
 String password='' ;

  register({
     required this.name ,
     required this.emial,
     required this.password,
   

  });
   register.fromJson(Map<String, dynamic> json) {
    name = json['name'];
   emial = json['emial'];
   password = json['password'];

 }
 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['emial'] = this.emial;
    data['password'] = this.password;
    return data;
 }

  static map(Function(dynamic e) param0) {}
  
}