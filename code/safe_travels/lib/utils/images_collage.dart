import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImagesCollageSf extends StatefulWidget {
  final List<String> imagePaths;
  const ImagesCollageSf({Key? key, required this.imagePaths}) : super(key: key);

  @override
  State<ImagesCollageSf> createState() => _ImagesCollageSfState();
}

class _ImagesCollageSfState extends State<ImagesCollageSf> {
  double tileSpacing = 0;
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      itemCount: widget.imagePaths.length,
      crossAxisCount: getCrossAxisCount(),
      itemBuilder: (BuildContext context, int index) => CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
          imageUrl: widget.imagePaths[index],
          fit: BoxFit.cover),
      staggeredTileBuilder: (int index) => StaggeredTile.count(
          getCellCount(true, index), getCellCount(false, index).toDouble()),
      mainAxisSpacing: tileSpacing,
      crossAxisSpacing: tileSpacing,
    );
  }

  int getCrossAxisCount() {
    return 3;
  }

  int getCellCount(bool isCrossAxis, int index) {
    return 1;
  }
}
