import 'package:project/domain/datasources/video_posts_datasource.dart';
import 'package:project/domain/entities/video_post.dart';
import 'package:project/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl extends VideoPostRepository {
  final VideoPostDatasource videoPostDatasource;

  VideoPostsRepositoryImpl({required this.videoPostDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }
}
