import 'package:flutter/material.dart';
import 'package:project/config/theme/app_theme.dart';
import 'package:project/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:project/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:project/presentation/providers/discover_provider.dart';
import 'package:project/presentation/screens/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videoPostDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
