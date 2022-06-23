List<Map<String, dynamic>> allMoviesMapper(Map<String, dynamic> map) {
  return List<Map<String, dynamic>>.from(
      map['allMovies']['edges'].map((item) => {
            'id': item['node']['id'],
            'imgUrl': item['node']['imgUrl'],
            'title': item['node']['title'],
            'releaseDate': item['node']['releaseDate'],
            'reviews': List<Map<String, dynamic>>.from(
                item['node']['movieReviewsByMovieId']['edges'].map((item) => {
                      'id': item['node']['nodeId'],
                      'userId': item['node']['userByUserReviewerId']['id'],
                      'userName': item['node']['userByUserReviewerId']['name'],
                      'title': item['node']['title'],
                      'body': item['node']['body'],
                      'rating': item['node']['rating']
                    }))
          }));
}
