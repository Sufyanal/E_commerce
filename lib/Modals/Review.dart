

// class Review {
//   List<Null>? reviews;

//   Review({this.reviews});

//   Review.fromJson(Map<String, dynamic> json) {
//     if (json['reviews'] != null) {
//       reviews = <Null>[];
//       json['reviews'].forEach((v) {
//         reviews!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.reviews != null) {
//       data['reviews'] = this.reviews;
//     }
//     return data;
//   }
// }
// // !.map((v) => v!.toJson()).toList()