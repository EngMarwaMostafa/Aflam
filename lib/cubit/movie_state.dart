
import 'package:aflam_movies/models/movie.dart';


abstract class MovieStates {}
class MovieInitial extends MovieStates{}
class GetMovies extends MovieStates {}
class NowPlayingMoviesLoaded extends MovieStates {}

class MoviesLoaded extends MovieStates {
  final List<Movie> movies;

  MoviesLoaded(this.movies);
}