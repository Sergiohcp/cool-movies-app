import 'package:coolmovies/controllers/reviews_controller.dart';
import 'package:coolmovies/controllers/user_controller.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/validators/reviews_validator.dart';
import 'package:coolmovies/widgets/custom_form_field_widget.dart';
import 'package:coolmovies/widgets/rounded_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewPage extends StatefulWidget {
  const CreateReviewPage({Key? key}) : super(key: key);

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
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

  @override
  Widget build(BuildContext context) {
    final isNewReview = arguments['review'] == null;

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
                              hintText: "Title",
                              hintStyle: CMTextStyles.createReviewPlaceholder,
                              validator: isEmptyTitle),
                          SizedBox(
                            height: 16,
                          ),
                          CustomFormField(
                              controller: bodyTextController,
                              hintText: "Description",
                              hintStyle: CMTextStyles.createReviewPlaceholder,
                              validator: isEmptyBody),
                        ],
                      ),
                    ),
                  ],
                ),
                RoundedButton(
                  text: isNewReview ? 'Create' : 'Edit',
                  width: MediaQuery.of(context).size.width,
                  isLoading: reviewsController.isReviewsLoading,
                  onTap: () {},
                )
              ],
            ),
          ),
        ));
  }
}
