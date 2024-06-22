import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constants/constants.dart';

class MovieCardMobWidget extends StatelessWidget {
  const MovieCardMobWidget({
    super.key,
    required this.movieList,
    required this.categoryName,
  });

  final List movieList;
  final String categoryName;

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
            child: Text(categoryName,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 8),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: CachedNetworkImage(
                          key: UniqueKey(),
                          imageUrl: 
                          "${Constants.imagePath}${movieList[index].posterPath}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                  color: Colors.grey.shade900,
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade900,
                  child: const Center(
                    child: Icon(Icons.error),
                  ),
                ),
                        ),
                      ),
                    ),
                itemCount: movieList.length),
          ),
        ],
      ),
    );
  }
}
