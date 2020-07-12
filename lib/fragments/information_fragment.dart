import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zaha/styles/color.dart';

class InformationFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InformationFragmentState();
}

class InformationFragmentState extends State<InformationFragment> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width:MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height/2.77,
          height: MediaQuery.of(context).size.height/3.7,
          child: VideoPlayerScreen()
      ),
    );
  }
}

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool visible=false;


  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: InkWell(
        onTap: (){
          setState(() {
            // If the video is playing, pause it.
            visible=!visible;
          });
        },
        child: Stack(
          children: <Widget>[
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: 16/9,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    visible?FloatingActionButton(
                      backgroundColor: whiteColor.withOpacity(0.2),
                      onPressed: () {
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {

                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                            visible=false;
                          }
                        });
                      },
                      // Display the correct icon depending on the state of the player.
                      child: Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: whiteColor,
                      ),
                    ):Container(),
                  ],
                ),
              ],
            )
          ],
        ),


      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}