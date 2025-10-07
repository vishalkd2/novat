import 'dart:convert';
import 'package:novat/models/post_model.dart';
import 'package:http/http.dart'as http;

class ApiServices{

  Future<List<PostModel>> displayPosts()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'),headers: {"Accept":"application/json"});
    if(response.statusCode==200){
      try{
        final List<dynamic> data = json.decode(response.body);
        return data.map((json)=>PostModel.fromJson(json)).toList();
      }catch (e){throw Exception("Parsing Error: $e");}
    }else{throw Exception("Failed to load Post");}
  }
}