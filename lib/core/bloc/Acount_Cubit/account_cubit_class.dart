import 'dart:async';

class AccountBloc {
  // Initialize necessary StreamControllers and variables
  final _followersController = StreamController<int>();
  final _followingController = StreamController<int>();
  final _postsController = StreamController<int>();
  final _bookingsController = StreamController<int>();

  Stream<int> get followersStream => _followersController.stream;
  Stream<int> get followingStream => _followingController.stream;
  Stream<int> get postsStream => _postsController.stream;
  Stream<int> get bookingsStream => _bookingsController.stream;

  // Business logic methods for updating the data
  void updateFollowers(int value) {
    _followersController.sink.add(value);
  }

  void updateFollowing(int value) {
    _followingController.sink.add(value);
  }

  void updatePosts(int value) {
    _postsController.sink.add(value);
  }

  void updateBookings(int value) {
    _bookingsController.sink.add(value);
  }

  // Close the StreamControllers when no longer needed
  void dispose() {
    _followersController.close();
    _followingController.close();
    _postsController.close();
    _bookingsController.close();
  }
}
