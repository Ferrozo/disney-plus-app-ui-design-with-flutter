import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../repository/movie_repository.dart';
import '../widgets/main_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listOfMovies = MovieRepository.moviesCard;
  int _page = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F9FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 0, 33, 60),
                radius: 22,
                backgroundImage: AssetImage('src/assets/lucas_profile.png')),
            Image.asset(
              'src/assets/disney_plus_logo.png',
              width: 100,
            ),
            Stack(
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color(0xFF063A8D),
                          width: 2,
                        )),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.arrow_down_to_line_alt,
                          color: Color(0xFF063A8D),
                        )),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 30,
                  child: Container(
                    alignment: Alignment.center,
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text('3', style: TextStyle(fontSize: 10)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const MainCard(),
              Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Channel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 10),
                            height: 62,
                            width: 100,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  // offset: const Offset(0, -1),
                                  blurRadius: 5,
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              'src/assets/logo$i.png',
                              width: 60,
                            ),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              color: Color.fromARGB(255, 51, 51, 51),
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < listOfMovies.length; i++)
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 15),
                            height: 212,
                            width: 190,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(1, 0),
                                  blurRadius: 5,
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 120,
                                  width: maxWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listOfMovies[i].image,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Text(listOfMovies[i].title,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      listOfMovies[i].duration,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 42,
                                      width: 42,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF429BEC),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: IconButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.play_arrow_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(listOfMovies[i].ratingStar,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 65,
        index: _page,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color(0xFF063A8D),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
        items: <Widget>[
          Icon(Icons.home,
              size: 26,
              color: _page == 0
                  ? Colors.white
                  : const Color.fromARGB(255, 84, 83, 83)),
          Icon(Icons.bookmark_border,
              size: 30,
              color: _page == 1
                  ? Colors.white
                  : const Color.fromARGB(255, 84, 83, 83)),
          Icon(Icons.search,
              size: 30,
              color: _page == 2
                  ? Colors.white
                  : const Color.fromARGB(255, 84, 83, 83)),
          Icon(Icons.notifications_rounded,
              size: 30,
              color: _page == 3
                  ? Colors.white
                  : const Color.fromARGB(255, 84, 83, 83)),
          Icon(Icons.settings_outlined,
              size: 30,
              color: _page == 4
                  ? Colors.white
                  : const Color.fromARGB(255, 84, 83, 83)),
        ],
      ),
    );
  }
}
