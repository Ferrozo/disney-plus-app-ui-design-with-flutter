import 'package:flutter/material.dart';
import '../constants/constant_colors.dart';
import '../repository/main_movie_card_repository.dart';
import 'home_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void backToHomePage(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      // builder: (context) => const MyHomePage(title: 'Home Page'),
    );
  }

  final movieInfo = MainMovieCardRepository.mainMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('src/assets/luca_movie_cover.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: IconButton(
                    onPressed: () {
                      backToHomePage(context);
                    },
                    icon: Icon(Icons.arrow_back_ios,
                        size: 25, color: Color(ConstantColors.whiteColor)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(movieInfo.title,
                            style: TextStyle(
                              color: Color(ConstantColors.whiteColor),
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            )),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              movieInfo.year,
                              style: TextStyle(
                                color: Color(ConstantColors.semiGreyColor)
                                    .withOpacity(0.8),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 20,
                              width: 2,
                              decoration: BoxDecoration(
                                color: Color(ConstantColors.semiGreyColor)
                                    .withOpacity(0.8),
                              ),
                            ),
                            Text(
                              movieInfo.genre,
                              style: TextStyle(
                                color: Color(ConstantColors.semiGreyColor)
                                    .withOpacity(0.8),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 20,
                              width: 2,
                              decoration: BoxDecoration(
                                color: Color(ConstantColors.semiGreyColor)
                                    .withOpacity(0.8),
                              ),
                            ),
                            Text(
                              movieInfo.duration,
                              style: TextStyle(
                                color: Color(ConstantColors.semiGreyColor)
                                    .withOpacity(0.8),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Icon(
                                Icons.star,
                                size: 25,
                                color: i != 4
                                    ? Colors.orange.withOpacity(0.8)
                                    : Color(ConstantColors.semiGreyColor)
                                        .withOpacity(0.6),
                              ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color(ConstantColors.semiGreyColor)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                color: Color(ConstantColors.whiteColor),
                                size: 70,
                              )),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Show More',
                          style: TextStyle(
                            color: Color(ConstantColors.semiGreyColor)
                                .withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,
                              color: Color(ConstantColors.whiteColor),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
