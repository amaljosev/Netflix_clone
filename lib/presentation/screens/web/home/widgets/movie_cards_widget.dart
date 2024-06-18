import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/core/styles/app_styles.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.movieList,
    required this.categoryName,
  });

  final List movieList;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(categoryName, style: AppStyles.titleStyle),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SizedBox(
                          height: size.height * 0.8,
                          width: size.width * 0.12,
                          child: Image.network(
                            "${Constants.imagePath}${movieList[index].posterPath}",
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Text('Failed to load image');
                            },
                          ),
                        ),
                      ),
                  itemCount: movieList.length),
            ),
          ],
        ),
      ),
    );
  }
}
