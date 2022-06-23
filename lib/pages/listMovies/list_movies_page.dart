import 'package:coolmovies/controllers/movies_controller.dart';
import 'package:coolmovies/controllers/user_controller.dart';
import 'package:coolmovies/core/cm_colors.dart';
import 'package:coolmovies/core/cm_text_styles.dart';
import 'package:coolmovies/pages/listMovies/widgets/list_movie_item_widget.dart';
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
      backgroundColor: CMColors.blueLight,
      appBar: AppBar(
        title: Text(
          'Cool Movies',
          style: CMTextStyles.appBar,
          textAlign: TextAlign.start,
        ),
        backgroundColor: CMColors.primary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: userController.logout,
          )
        ],
      ),
      body: Obx(
        () => userController.isUserLoading || moviesController.isMoviesLoading
            ? Center(
                child: CircularProgressIndicator(
                color: CMColors.primary,
              ))
            : ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                separatorBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const Divider(
                        color: CMColors.white,
                      ),
                    ),
                itemCount: moviesController.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: ListMovieItem(
                    image: moviesController.movies[index].imgUrl,
                    title: moviesController.movies[index].title,
                    onTap: () {
                      moviesController
                          .chooseMovie(moviesController.movies[index].id);
                      Get.toNamed('/MovieDetails');
                    },
                  ));
                }),
      ),
    );
  }
}
