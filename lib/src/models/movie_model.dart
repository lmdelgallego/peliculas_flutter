class Movies {
  List<Movie> items = new List();

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final movie = new Movie.fromJsonMap(item);
      items.add(movie);
    }
  }
}

class Movie {
  String title;
  String originalTitle;
  String posterPath;
  bool video;
  double voteAverage;
  double popularity;
  String overview;
  String releaseDate;
  int id;
  bool adult;
  String backdropPath;
  int voteCount;
  List<int> genreIds;
  String originalLanguage;

  Movie({
    this.title,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.popularity,
    this.overview,
    this.releaseDate,
    this.id,
    this.adult,
    this.backdropPath,
    this.voteCount,
    this.genreIds,
    this.originalLanguage,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    title = json['title'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    popularity = json['popularity'] / 1;
    overview = json['overview'];
    releaseDate = json['release_date'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    voteCount = json['vote_count'];
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'https://www.segelectrica.com.co/wp-content/themes/consultix/images/no-image-found-360x250.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
