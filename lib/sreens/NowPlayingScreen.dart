
import 'package:aflam_movies/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DetailsSreen.dart';


class NowPlaying extends StatelessWidget {

  final List nowplaying;

  const  NowPlaying({Key? key, required this.nowplaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'NowPlaying Movies',color: Colors.grey, size: 26,),
          Container(
              height: 270,
              width:double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: nowplaying.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  name: nowplaying[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['poster_path'],
                                  description: nowplaying[index]['overview'],
                                  vote: nowplaying[index]['vote_average']
                                      .toString(),
                                  launch_on: nowplaying[index]
                                  ['release_date'],
                                )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width:double.infinity,
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(5),
                                width:double.infinity,
                                height:140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                child:Image(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          nowplaying[index]['poster_path']),
                                  fit: BoxFit.cover,
                                )
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                size: 15,
                                text: nowplaying[index]['title'] != null
                                    ? nowplaying[index]['title']
                                    : 'Loading', color: Colors.black,),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}


