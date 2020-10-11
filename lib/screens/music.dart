import 'package:flutter/material.dart';
import 'package:layout/models/Song.dart';
import 'package:layout/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as jsonParser;

class MusicStore extends StatefulWidget {
  MusicStore({Key key}) : super(key: key);

  @override
  _MusicStoreState createState() => _MusicStoreState();
}

class _MusicStoreState extends State<MusicStore> {
  List<Song> songs = [];
  _fillSongs(List<dynamic> listOfSongs) {
    print(listOfSongs);
    var tempsongs = listOfSongs.map((singleSong) {
      Song song = new Song();
      song.name = singleSong['trackName'];
      song.aName = singleSong['collectionName'];
      song.url = singleSong['artworkUrl60'];
      return song;
    }).toList();
    print("Songs are :::: $songs");

    setState(() {
      songs = tempsongs;
    });
  }

  _loadSongs() {
    String url = Constants.getURL("Sonu Nigam");
    print('url is $url');
    Future<http.Response> future = http.get(url);
    future.then((response) {
      print('Response is ${response.body}');
      var map = jsonParser.jsonDecode(response.body);
      _fillSongs(map['results']);
    }).catchError((error) => print('error is $error'));
  }

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  List<Widget> printSongs() {
    return songs.map((song) {
      return Container(
        margin: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListTile(
              leading: Image.network(song.url),
              title: Text(song.name),
              subtitle: Text(song.aName),
              trailing: IconButton(
                icon: Icon(
                  Icons.play_circle_filled,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      // return Card(
      //     elevation: 5,
      //     shadowColor: Colors.white60,
      //     child: Row(
      //       children: <Widget>[
      //         Image.network(song.url),
      //         Padding(
      //           padding: EdgeInsets.all(10),
      //           child: Text(
      //               song.name.substring(
      //                   0, song.name.length > 30 ? 30 : song.name.length),
      //               overflow: TextOverflow.clip,
      //               softWrap: true),
      //         ),
      //         Align(
      //           alignment: Alignment.centerRight,
      //           child: IconButton(
      //               icon: Icon(
      //                 Icons.play_circle_filled,
      //                 size: 30,
      //                 color: Colors.blue,
      //               ),
      //               onPressed: () {}),
      //         )
      //       ],
      //     ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Music Store"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: printSongs(),
          ),
        ),
      ),
    );
  }
}
