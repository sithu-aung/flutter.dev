import 'package:flutter/material.dart';
import 'package:flutter_app/home/web_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabPerView extends StatefulWidget {
  String url;
  String title;
  String body;
  Color color;
  TabPerView(
      {Key? key,
      required this.url,
      required this.title,
      required this.body,
      required this.color})
      : super(key: key);

  @override
  State<TabPerView> createState() => _TabPerViewState();
}

class _TabPerViewState extends State<TabPerView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _controller.value.isInitialized
              ? FittedBox(
                  fit: BoxFit.cover,
                  child: Transform.scale(
                    alignment: Alignment.center,
                    scale: 1.25,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              :  SizedBox(
            height: MediaQuery.of(context).size.width * 0.55,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            widget.title,
            style: GoogleFonts.notoSans(
                fontSize: 22, color: widget.color, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.body,
            style: GoogleFonts.notoSans(fontSize: 17, color: Colors.black),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                AppLocalizations.of(context)!.try_in_dartpad,
                style: GoogleFonts.notoSans(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 4, 104, 215),
                    fontWeight: FontWeight.w600),
              ),
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              
              side: const BorderSide(
                color: Color.fromARGB(255, 4, 104, 215),
                width: 1,
              ),
              primary: const Color.fromARGB(255, 4, 104, 215),
            ),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: "https://dartpad.dev/?id=bbd3f10c2593f0add04dd770318b33f7")));
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
