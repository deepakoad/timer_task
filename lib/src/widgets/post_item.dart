import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../model/post_model.dart';
import '../viewmodel/post_viewmodel.dart';
import 'package:provider/provider.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final VoidCallback onTap;

  const PostItem({required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PostViewModel>(context, listen: false);

    return VisibilityDetector(
      key: Key(post.id.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          vm.startTimer(post);
        } else {
          vm.stopTimer(post);
        }
      },

      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          padding: EdgeInsets.all(14),

          // ⭐ Modern Card Look
          decoration: BoxDecoration(
            color: post.isRead ? Colors.white : Colors.yellow.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: post.isRead ? Colors.grey.shade300 : Colors.amber.shade300,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Expanded(
                child: Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),

              // Timer section
              Row(
                children: [
                  Icon(Icons.timer, size: 20, color: Colors.blue),
                  SizedBox(width: 6),
                  Text(
                    "${post.remainingSeconds}s",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
