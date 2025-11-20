import 'dart:async';
import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../repository/post_repository.dart';

class PostViewModel with ChangeNotifier {
  final PostRepository _repo = PostRepository();

  List<PostModel> posts = [];
  bool isLoading = false;
  String? error;

  Map<int, Timer?> _timers = {};

  Future<void> loadPosts() async {
    try {
      isLoading = true;
      notifyListeners();

      posts = await _repo.fetchPosts();
      isLoading = false;
      notifyListeners();

      // Start timer only for visible items
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
  }

  // -------------------------- TIMER START --------------------------
  void startTimer(PostModel post) {
    if (_timers[post.id] != null && _timers[post.id]!.isActive) return;

    _timers[post.id] = Timer.periodic(Duration(seconds: 1), (timer) {
      if (post.remainingSeconds > 0) {
        post.remainingSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void stopTimer(PostModel post) {
    _timers[post.id]?.cancel();
    _timers[post.id] = null;
  }
  // -------------------------- TIMER END --------------------------

  // Mark as read
  void markAsRead(int id) {
    final p = posts.firstWhere((e) => e.id == id);
    p.isRead = true;
    notifyListeners();
  }

  Future<PostModel> fetchPostDetail(int id) async {
    return await _repo.fetchPostDetail(id);
  }
}
