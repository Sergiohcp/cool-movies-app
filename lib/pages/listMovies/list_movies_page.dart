import 'package:coolmovies/controllers/movies_controle.dart';
import 'package:coolmovies/controllers/user_controller.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMoviesPage extends StatefulWidget {
  const ListMoviesPage({Key? key}) : super(key: key);

  @override
  State<ListMoviesPage> createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  final userController = Get.find<UserController>();
  final moviesController = Get.find<MoviesController>();

  void currentUser() async {
    if (userController.user.name.isEmpty) {
      await userController.currentUser();
    }
    await moviesController.allMovies();
  }

  @override
  void initState() {
    currentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cool Movies',
          style: CMTextStyles.listMoviesAppBar,
          textAlign: TextAlign.start,
        ),
        backgroundColor: CMColors.secondary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: userController.logout,
          )
        ],
      ),
      body: Obx(
        () => userController.isUserLoading
            ? Center(
                child: CircularProgressIndicator(
                color: CMColors.primary,
              ))
            : ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: moviesController.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      trailing: Text(
                        moviesController.movies[index].title,
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("List item $index"));
                }),
      ),
    );
  }
}
