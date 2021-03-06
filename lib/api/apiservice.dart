
import 'package:demo_api/Model/country.dart';
import 'package:demo_api/Model/detail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part'apiservice.g.dart';
@RestApi(baseUrl :'https://restcountries.eu/rest/v2/' )
abstract class ApiService{
factory ApiService(Dio dio)=_ApiService;
@GET('all')
Future<List<Country>> getCountries();
@GET('name/{name}?fullText=true')
Future<List<Detail>> getDetail(@Path() String name);
}