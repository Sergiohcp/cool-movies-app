import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/models/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReview extends StatelessWidget {
  const CreateReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Review? review = Get.arguments;

    return Scaffold(
        backgroundColor: CMColors.blueLight,
        appBar: AppBar(
          backgroundColor: CMColors.primary,
          title: Text(
            review == null ? 'Create review' : 'Edit review',
            style: CMTextStyles.appBar,
            textAlign: TextAlign.start,
          ),
        ),
        body: Column(
          children: [],
        ));
  }
}
