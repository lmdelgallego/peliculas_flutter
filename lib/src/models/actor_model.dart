class Cast {
  List<Actor> actorsList = new List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((element) {
      final actor = Actor.fromJsonMap(element);
      actorsList.add(actor);
    });
  }
}

class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['know_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  getPhoto() {
    if (profilePath == null) {
      return 'https://lh3.googleusercontent.com/proxy/vE5yMu7SJuUEBILZtOnCxZ6EhERSiMUtG-b6fZpLRGjfAZdrutaj0NauQC1vtUpmMzbMKwTF7r9YqlvVc7LU_IIgCY8TQfRK9756FUkWiW9BFb9_0A8qr8OYFWEX';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
