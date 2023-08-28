
import 'package:flutter/material.dart';
import '../main.dart';
import '../model.dart/Product_modals.dart';


class FavoriteIconButton extends StatefulWidget {
  final Product favoriteproduct;
  Function? state;
  bool isFavorite=true;

  FavoriteIconButton(
      {super.key, required this.favoriteproduct, this.state, required this.isFavorite, });

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isFavorite = !widget.isFavorite;
          if (widget.state != null) {
            widget.state!();
          }

          if (widget.isFavorite == true) {
            if (favorite
                .any((element) => element.id == widget.favoriteproduct.id)) {
             
            } else {
              favorite.add(widget.favoriteproduct);

            }
          } else {
            favorite.remove(widget.favoriteproduct);
           
          }
        });
      },
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: Theme.of(context).colorScheme.secondary,),
        child: Icon(
          widget.isFavorite == true
              ? Icons.favorite
              : Icons.favorite_border_rounded,
          size: 20,
          color: widget.isFavorite == true ?  Colors.red : Colors.white,
        ),
      ),
    );
  }
}