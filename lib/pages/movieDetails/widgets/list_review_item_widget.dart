import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/models/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListReviewItem extends StatelessWidget {
  final Review review;

  final double BORDER_WIDTH = 1;
  final double BORDER_RADIUS = 25;

  const ListReviewItem({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: CMColors.white,
          border: Border.all(color: CMColors.secondary, width: BORDER_WIDTH),
          borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS)),
          boxShadow: [
            BoxShadow(
              color: CMColors.grayDark.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(0, 0.5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    review.userName,
                    style: CMTextStyles.reviewUserName,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    review.title,
                    style: CMTextStyles.reviewTitle,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                review.body,
                style: CMTextStyles.reviewBody,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        for (var i = 0; i < review.rating; i++)
                          Icon(
                            Icons.star,
                            color: CMColors.yellow,
                          )
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      //padding: const EdgeInsets.all(8.0),
                      primary: CMColors.secondary,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'Edit',
                          style: CMTextStyles.reviewEditButton,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: CMColors.secondary,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
