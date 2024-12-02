import 'package:project/domain/datasources/video_posts_datasource.dart';
import 'package:project/domain/entities/video_post.dart';
import 'package:project/infrastructure/models/local_video_model.dart';
import 'package:project/shared/data/local_video_posts.dart';

class LocalVideoDatasource extends VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
