class Post {
  String body;
  String author;
  String url;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author, this.url);

  void likePost() {
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
}
