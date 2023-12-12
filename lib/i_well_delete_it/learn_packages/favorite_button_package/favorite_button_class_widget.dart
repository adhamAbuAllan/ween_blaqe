import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class FavoriteButtonCardWidget extends StatefulWidget {
  const FavoriteButtonCardWidget({super.key});

  @override
  State<FavoriteButtonCardWidget> createState() =>
      _FavoriteButtonCardWidgetState();
}

class _FavoriteButtonCardWidgetState extends State<FavoriteButtonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return
      //Code snippet of a card widget//
          /** Card Widget **/
          Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: SizedBox(
          width: 380,
          height: 720,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green[500],
                  radius: 108,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"),
                    //NetworkImage
                    radius: 100,
                  ), //CircleAvatar
                ), //CircleAvatar
                const SizedBox(
                  height: 10,
                ), //SizedBox
                Text(
                  'GeeksforGeeks',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green[900],
                    fontWeight: FontWeight.w500,
                  ), //Textstyle
                ), //Text
                const SizedBox(
                  height: 10,
                ), //SizedBox
                Text(
                  " GeeksforGeeks is a computer science portal "
                      "            for geeks at geeksforgeeks.org. It contains "
                          "          well written, well thought and well explained"
                          "            computer science and programming articles,"
                          "          quizzes, projects, interview experiences"
                          "            and much more!!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green[900],
                  ), //Textstyle
                ), //Text
                const SizedBox(
                  height: 10,
                ), //SizedBox
                SizedBox(
                  height: 40                                                                  ,
                  child: ElevatedButton(
                    onPressed: () {},
                    // color: Colors.green,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Icon(Icons.touch_app),
                          Text('Visit'),
                        ],
                      ), //Row
                    ), //Padding
                  ), //RaisedButton
                ),
                //SizedBox  // Favourite Button
                FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    debugPrint('Is Favorite : $isFavorite');
                  },
                )
              ],
            ), //Column
          ), //Padding
        ), //SizedBox

    );
  }
}
