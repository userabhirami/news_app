import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreenWidget extends StatelessWidget {
  final String title;
  final String des;
  final String author;
  final String date;
  final String image;

  const HomeScreenWidget(
      {super.key,
      required this.title,
      required this.des,
      required this.author,
      required this.date,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ), //title

            Image.network(image),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    author,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ), //author
                ),
                SizedBox(
                  child: Text(
                    date,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Share.share(title);
                    },
                    icon: Icon(Icons.share)) //published date
              ],
            ),
            SizedBox(
              //description
              child: Text(
                des,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
