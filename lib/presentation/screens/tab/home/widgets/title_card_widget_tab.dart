import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants/constants.dart';
import 'package:netflix/core/styles/app_styles.dart';

class TitleCardWidgetTab extends StatelessWidget {
  const TitleCardWidgetTab({
    super.key,
    required this.movieList,
  });

  final List movieList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.40,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "${Constants.imagePath}${movieList[0].imgPath}"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(movieList[0].title,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold)),
                  Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black38,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                            onPressed: () {},
                            label: const Text('Play'),
                            icon: const Icon(Icons.play_arrow),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black38,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                            onPressed: () {},
                            label: const Text('My List'),
                            icon: const Icon(Icons.add),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        movieList[0].overview,
                        style: AppStyles.titleStyle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
