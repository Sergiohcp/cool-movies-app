import 'package:coolmovies/controllers/user_controller.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_images.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/validators/user_validator.dart';
import 'package:coolmovies/widgets/custom_form_field_widget.dart';
import 'package:coolmovies/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPage();
}

class _CreateUserPage extends State<CreateUserPage> {
  final userController = Get.find<UserController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController();

  void createUser(String name) async {
    await userController.createUser(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: CMColors.white),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 80, left: 24, right: 24, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          CMImages.logo,
                          scale: 3,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Hey, nice to meet you, to start, tell us your name!",
                          style: CMTextStyles.createUserTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomFormField(
                                controller: nameTextController,
                                validator: isEmptyName,
                                hintText: "Name",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => RoundedButton(
                        text: "Enter",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            createUser(nameTextController.text);
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        isLoading: userController.isUserLoading,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
