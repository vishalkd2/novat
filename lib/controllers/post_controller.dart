

import 'package:get/get.dart';
import 'package:novat/models/post_model.dart';
import 'package:novat/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostController extends GetxController{
  var isLoading = true.obs;
  var postList = <PostModel>[].obs;
  var readPostIds = <int>[].obs;

  @override
  void onInit(){
    fetchPosts();
    loadReadPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try{
      isLoading(true);
      var  posts = await ApiServices().displayPosts();
      postList.assignAll(posts);
    }catch(e){Get.snackbar("Errpr", "Failed to load data");}
    finally {isLoading(false);}
  }
  Future<void> marksAsRead(int postId)async {
    if(!readPostIds.contains(postId)){
      readPostIds.add(postId);
      readPostIds.refresh();
      SharedPreferences prefs =await SharedPreferences.getInstance();
      await prefs.setStringList('readPosts', readPostIds.map((e)=>e.toString()).toList());
    }
  }

  Future<void> loadReadPosts()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? storedIds = preferences.getStringList('readPosts');
    if (storedIds != null) {
      readPostIds.assignAll(storedIds.map((e) => int.parse(e)).toList());
    }
  }

}