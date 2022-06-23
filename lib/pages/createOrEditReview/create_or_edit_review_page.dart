import 'package:coolmovies/controllers/reviews_controller.dart';
import 'package:coolmovies/controllers/user_controller.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/models/create_review.dart';
import 'package:coolmovies/models/update_review.dart';
import 'package:coolmovies/validators/reviews_validator.dart';
import 'package:coolmovies/widgets/custom_form_field_widget.dart';
import 'package:coolmovies/widgets/rounded_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOrEditReviewPage extends StatefulWidget {
  const CreateOrEditReviewPage({Key? key}) : super(key: key);

  @override
  State<CreateOrEditReviewPage> createState() => _CreateOrEditReviewPageState();
}

class _CreateOrEditReviewPageState extends State<CreateOrEditReviewPage> {
  final userController = Get.find<UserController>();
  final reviewsController = Get.find<ReviewsController>();
  final arguments = Get.arguments;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleTextController = TextEditingController();
  TextEditingController bodyTextController = TextEditingController();
  int rating = 1;

  @override
  void initState() {
    titleTextController.text = arguments['review'].title;
    bodyTextController.text = arguments['review'].body;
    setState(() {
      rating = arguments['review'].rating;
    });
  }

  void onChangeRating(int n) {
    setState(() {
      rating = n;
    });
  }

  void onSubmit() async {
    if (arguments['review'].title.isEmpty) {
      return await reviewsController.createReview(CreateReview.createReview({
        'movieId': arguments['movie'].id,
        'userReviewerId': userController.user.id,
        'title': titleTextController.text,
        'body': bodyTextController.text,
        'rating': rating
      }));
    }
    await reviewsController.updateReview(UpdateReview.updateReview({
      'nodeId': arguments['review'].id,
      'movieId': arguments['movie'].id,
      'userReviewerId': userController.user.id,
      'title': titleTextController.text,
      'body': bodyTextController.text,
      'rating': rating
    }));
  }

  @override
  Widget build(BuildContext context) {
    final isNewReview = arguments['review'].title.isEmpty;

    return Scaffold(
        backgroundColor: CMColors.blueLight,
        appBar: AppBar(
          backgroundColor: CMColors.primary,
          title: Text(
            isNewReview ? 'Create review' : 'Edit review',
            style: CMTextStyles.appBar,
            textAlign: TextAlign.start,
          ),
        ),
        body: Container(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomFormField(
                            controller: titleTextController,
                            validator: isEmptyTitle,
                            hintText: "Title",
                            hintStyle: CMTextStyles.createReviewPlaceholder,
                            style: TextStyle(color: CMColors.white),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          CustomFormField(
                            controller: bodyTextController,
                            validator: isEmptyBody,
                            hintText: "Description",
                            hintStyle: CMTextStyles.createReviewPlaceholder,
                            style: TextStyle(color: CMColors.white),
                            maxLines: 8,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              for (var i = 1; i <= rating; i++)
                                GestureDetector(
                                  onTap: () {
                                    onChangeRating(i);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: CMColors.yellow,
                                    size: 30,
                                  ),
                                ),
                              for (var i = rating + 1; i <= 5; i++)
                                GestureDetector(
                                  onTap: () {
                                    onChangeRating(i);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: CMColors.gray,
                                    size: 30,
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                RoundedButton(
                  text: isNewReview ? 'Create' : 'Edit',
                  width: MediaQuery.of(context).size.width,
                  isLoading: reviewsController.isReviewsLoading,
                  onTap: onSubmit,
                )
              ],
            ),
          ),
        ));
  }
}
