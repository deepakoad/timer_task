import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/post_viewmodel.dart';
import '../widgets/post_item.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostViewModel>(context, listen: false).loadPosts();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.dashboard, color: Colors.white, size: 26),

                      Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.blue),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Welcome back 👋",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Consumer<PostViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) return Center(child: CircularProgressIndicator());
          if (vm.error != null) return Center(child: Text(vm.error!));

          return ListView.builder(
            itemCount: vm.posts.length,
            itemBuilder: (context, index) {
              final post = vm.posts[index];

              return PostItem(
                post: post,
                onTap: () {
                  vm.markAsRead(post.id);
                  vm.stopTimer(post);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(postId: post.id),
                    ),
                  ).then((_) => vm.startTimer(post));
                },
              );
            },
          );
        },
      ),
    );
  }
}
