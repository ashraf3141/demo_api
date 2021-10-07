import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_api/Model/country.dart';
import 'package:demo_api/api/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'detail_screen.dart';
class Home extends StatelessWidget {
  ApiService apiService=ApiService(Dio());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Country>>(
          future: apiService.getCountries(),
          builder: (context,snapshot){
            if(snapshot.hasData){
            List<Country>? country= snapshot.data;
            return ListView.builder(
              itemCount: country!.length,
              itemBuilder: (context,position){
                return item(country[position],context);
              },
            );
            }
           return Center(child: CircularProgressIndicator(),);
          }),
    );
  }
Widget item(Country country,context)
{
  return ListTile(
    onTap: (){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_Screen(apiService,country.name)));
    },
     leading: CachedNetworkImage(
       imageUrl:"https://www.countryflags.io/${country.alpha2Code}/flat/64.png",
       width: 100,
       height: 80,
       placeholder: (_,__,)=>Center(child: CircularProgressIndicator(),),
     ),
    title: Text(country.name),
    subtitle: Text(country.region),
  );
}
}

