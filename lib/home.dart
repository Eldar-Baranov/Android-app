import 'package:flutter/material.dart';
import 'package:gifs_finder2/Gif.API.dart';

// There are several errors in my code that I know in theory what caused them.

//  1/2 RangeError(index):
//  Invalid The error pops up when the application starts and when the search
//  doesn't find the Gif image: For example, if you just keep typing characters.
//  The error is due to the application trying to display images that don't exist.
//  I tried to write into the widget a logical operator "if else" so it would check for items, but it can't be written to the widget.

//  3 Downloading files in real time.
//  My code finds 20 gif images and tries to load them immediately because of this you have to wait a bit for all images to be loaded.
//  Real time file uploading did not work for me.
//  I think the solution would be to write a method that would load the gif images as the user scrolled the screen.

//  4 Loading images on the screen is not systematic.
//  First the last image may load and then the first one.
//  I think the solution to 3 problems would have solved this one as well.

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _search = '';
  int _offset = 0;
  late List<Gif> _gif;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getGif(_search);
  }

  Future<void> getGif(_search) async {
    _gif = await GifApi.getGif(_search);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(width: 10), Text('Giphy')],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "gif search",
                  fillColor: Colors.black12,
                  filled: true),
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                  _offset++;
                  print(_search);
                  print(_offset);
                  getGif(_search);
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.network("${_gif[0].url}"),
                  Image.network("${_gif[1].url}"),
                  Image.network("${_gif[2].url}"),
                  Image.network("${_gif[3].url}"),
                  Image.network("${_gif[4].url}"),
                  Image.network("${_gif[5].url}"),
                  Image.network("${_gif[6].url}"),
                  Image.network("${_gif[7].url}"),
                  Image.network("${_gif[8].url}"),
                  Image.network("${_gif[9].url}"),
                  Image.network("${_gif[10].url}"),
                  Image.network("${_gif[11].url}"),
                  Image.network("${_gif[12].url}"),
                  Image.network("${_gif[13].url}"),
                  Image.network("${_gif[14].url}"),
                  Image.network("${_gif[15].url}"),
                  Image.network("${_gif[16].url}"),
                  Image.network("${_gif[17].url}"),
                  Image.network("${_gif[18].url}"),
                  Image.network("${_gif[19].url}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
