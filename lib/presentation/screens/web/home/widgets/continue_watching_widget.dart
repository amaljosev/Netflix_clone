import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/core/styles/app_styles.dart';

class ContinueWatchingWidget extends StatelessWidget {
  const ContinueWatchingWidget({
    super.key, required this.movieList
  });

  final List movieList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Continue Watching username',
                style: AppStyles.titleStyle),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  height: size.height * 0.4,
                  width: size.width * 0.15,
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.20,
                        width: size.width * 0.20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${Constants.imagePath}${movieList[index].imgPath}"))),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_circle_outline_rounded,
                                size: 60,
                              )),
                        ),
                      ),
                      const LinearProgressIndicator(
                        value: 0.5,
                        valueColor:
                            AlwaysStoppedAnimation(Colors.red),
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.20,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(movieList[index].title),
                          subtitle: Text(movieList[index]
                              .releaseDate),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.info_outlined)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: movieList.length,
            ),
          ),
        ],
      ),
    );
  }
}
