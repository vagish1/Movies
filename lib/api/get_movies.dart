// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/rajkumar_sir_model.dart';

class GetMovieApi {
  GetMovieApi.init(); //named
  static final GetMovieApi instance = GetMovieApi.init();
  Future<Movies> getMovieData() async {
    // final Dio ins = Dio();
    try {
      final http.Response response = await http.post(
          Uri.parse("https://hoblist.com/api/movieList"),
          // options: Options(headers: {
          //   "Cookie":
          //       "connect.sid=s%3AsZy5laW6_njbyW2_3p1vzAW6EVU-0Ei2.Vtg2l4wwLexQSMlGWaDZGa4fk9VFA%2BLV1qUsrCMKepQ"
          // }),
          body: {
            "category": "movies",
            "language": "kannada",
            "genre": "all",
            "sort": "voting"
          });
      // jsonDecode(response.body);
      // Logger().d();

      final Movies model = Movies.fromJson(jsonDecode(response.body));

      return Future.value(model);
    } on Exception {
      return Future.error("An error Occured");
    }
  }
}
