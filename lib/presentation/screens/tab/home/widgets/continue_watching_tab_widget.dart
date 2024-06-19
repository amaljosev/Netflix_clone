import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/core/styles/app_styles.dart';

class ContinueWatchingTabWidget extends StatelessWidget {
  const ContinueWatchingTabWidget({super.key, required this.movieList});

  final List movieList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('Continue Watching username', style: AppStyles.titleStyle),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.3,
                      maxWidth: size.width * 0.25,
                      minHeight: size.height * 0.2,
                      minWidth: size.width * 0.25
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: NetworkImage(
                                    "${Constants.imagePath}${movieList[index].imgPath}"),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.play_circle_outline_outlined,
                                      size: size.width * 0.1)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              itemCount: movieList.length,
            ),
          ),
        ],
      ),
    );
  }
}
