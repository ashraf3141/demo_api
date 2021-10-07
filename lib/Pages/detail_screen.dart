import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_api/Model/country.dart';
import 'package:demo_api/Model/detail.dart';
import 'package:demo_api/api/apiservice.dart';
import 'package:flutter/material.dart';

class Detail_Screen extends StatelessWidget {
  final ApiService apiService;
  final String country_name;
  Detail_Screen(this.apiService, this.country_name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen")),
      body: FutureBuilder<List<Detail>>(
        future: apiService.getDetail(country_name),
        builder: (context,snapshot){
          print('${snapshot.data}:${snapshot.hasData}:${snapshot.hasError}');
          if(snapshot.hasData){
            Detail detail =snapshot.data![0];
            return ListView(
              children: [
                Text('name: ${detail.name}',
                style: TextStyle(fontSize: 25),),
                Text('region: ${detail.region}',
                style: TextStyle(fontSize: 20),),
                Text('subregion: ${detail.subregion}',
                  style: TextStyle(fontSize: 20),),
                Text('Population: ${detail.population}',
                  style: TextStyle(fontSize: 20),),
                Text('demonym: ${detail.demonym}',
                  style: TextStyle(fontSize: 20),),
                Center(
                  child: CachedNetworkImage(
                    imageUrl:"https://www.countryflags.io/${detail.alpha2Code}/flat/64.png",
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: (_,__,)=>Center(child: CircularProgressIndicator(),),
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}