
import 'package:flutter/material.dart';
import 'package:novat/controllers/post_controller.dart';
import 'package:get/get.dart';
import 'package:novat/screens/post_details_screen.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});
  final PostController postController =  Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PostList"),centerTitle: true,automaticallyImplyLeading: false),
      body: Obx((){
        if(postController.isLoading.value){
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(itemCount: postController.postList.length,itemBuilder: (context,index){
          final post = postController.postList[index];
          return Obx((){
            final isRead = postController.readPostIds.contains(post.id);
            return Card(
              elevation: 4,shadowColor: Colors.black26,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: EdgeInsets.symmetric(vertical: 10),
              color: isRead? Colors.white: Colors.amber.shade100,
              child: ListTile(
                leading: Text(post.id.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                title: Text(post.title,style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),maxLines: 1),
                subtitle: Text(post.body,style: TextStyle(fontSize: 15,overflow: TextOverflow.ellipsis),maxLines: 1),
                onTap: ()async{
                  await postController.marksAsRead(post.id);
                  await Get.to(PostDetailScreen(model: post));},
              ),
            );
          });
        });
      }),
    );
  }
}
