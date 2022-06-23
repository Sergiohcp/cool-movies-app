import 'package:cached_network_image/cached_network_image.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListMovieItem extends StatelessWidget {
  final image;
  final title;
  final VoidCallback onTap;

  const ListMovieItem(
      {Key? key, required this.image, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                    imageUrl: image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: CMTextStyles.listMovieItemTitle,
                )
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined,
                color: CMColors.gray, size: 20)
          ]),
        ),
      ),
    );
  }
}
