import '../models/movie.dart';

class MovieRepository {
  static List<Movie> moviesCard = [
    Movie(
        title: 'Moana',
        duration: '1h 43m',
        image: 'src/assets/moana.jpeg',
        ratingStar: '9.5'),
    Movie(
        title: 'Encato',
        duration: '1h 49m',
        image: 'src/assets/encato.jpeg',
        ratingStar: '9.5'),
    Movie(
        title: 'Soul',
        duration: '1h 40m',
        image: 'src/assets/soul.jpg',
        ratingStar: '9.5'),
  ];
}
