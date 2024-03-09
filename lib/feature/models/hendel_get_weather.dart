

/*class weather {
  int ? id;
  String? name;
  String? region;
  String? country;
  dynamic? lat;
  dynamic ? lon;
  String? url;



  weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    url = json['url'];
  }


}*/


class Weather1 {

 List<LdataW> DataMap =[];
                          //error list<Map>
    Weather1.forJson(List<dynamic>    data ){

     data.forEach((element) {

    DataMap .add( LdataW.forjson(element)  );



    });

  }



}

class lisst{




}

class  LdataW {
  int ? id;
  String? name;
  String? region;
  String? country;
  dynamic? lat;
  dynamic ? lon;
  String? url;


  LdataW.forjson(  Map json ){


    id = json['id'];
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    url = json['url'];






  }



}