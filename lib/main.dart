import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final player = AudioPlayer();

  Expanded musicButton(String movieName, String movieYear) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/$movieName.jpg'), fit: BoxFit.cover)
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                await player.play(AssetSource('${movieYear}_$movieName.mp3'));
              },
              child: Icon(Icons.play_arrow),
            ),
            Text(movieName, style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextButton(
                //   onPressed: () async {
                //     await player.play(AssetSource('1998_following.mp3'));
                //   },
                //   child: Icon(Icons.play_arrow),
                // ),
                // TextButton(
                //   onPressed: () async {
                //     await player.play(AssetSource('2000_memento.mp3'));
                //   },
                //   child: Icon(Icons.play_arrow),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //       onPressed: () async {
                //         await player.play(AssetSource('2023_oppenheimer.mp3'));
                //       },
                //       child: Icon(Icons.play_arrow),
                //     ),
                //     Text('Oppenheimer')
                //   ],
                // ),
                musicButton('following', '1998'),
                musicButton('memento', '2000'),
                musicButton('insomnia', '2002'),
                musicButton('batman_begins', '2005'),
                musicButton('the_prestige', '2006'),
                musicButton('the_dark_knight', '2008'),
                musicButton('inception', '2010'),
                musicButton('dark_knight_rises', '2012'),
                musicButton('interstellar', '2014'),
                musicButton('dunkirk', '2017'),
                musicButton('tenet', '2020'),
                musicButton('oppenheimer', '2023'),
                musicButton('the_odyssey', '2026'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
