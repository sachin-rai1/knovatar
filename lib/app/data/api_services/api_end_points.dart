class ApiEndPoints {
  static const String getPost = 'posts';
  static String getPostById({required int postId}) => 'posts/$postId';
}