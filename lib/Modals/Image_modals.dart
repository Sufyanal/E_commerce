import 'dart:io';

class image{
   File? Image1;

  static var path;

   image({
      this.Image1,
   });
   image.fromJson(Map<String, dynamic> json) {
        if (json["Image1"] != null && json["Image1"] != "") {
      Image1 = File(json["Image1"]);
   }
   }
   
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
     if (this.Image1 != null) {
      data['Image1'] = this.Image1!.path;
    }
    return data;
    }
}