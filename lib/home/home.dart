import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/home/tab_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            'Flutter',
            style: GoogleFonts.notoSans(fontSize: 22, color: Colors.white),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset(
              "assets/flutter_logo.png",
              width: 42,
            ),
          ),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: const TextTheme().apply(bodyColor: Colors.white),
              ),
              child: PopupMenuButton<int>(
                color: Colors.white,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/english.png",
                          width: 24,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          AppLocalizations.of(context)!.english,
                          style: GoogleFonts.notoSans(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/myanmar.png",
                          width: 24,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          AppLocalizations.of(context)!.myanmar,
                          style: GoogleFonts.notoSans(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                AppLocalizations.of(context)!.flutter_about,
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSans(
                    fontSize:
                        ref.watch(localeProvider).toString() == 'en' ? 22 : 18,
                    color: Colors.black,
                    height: ref.watch(localeProvider).toString() == 'en'
                        ? 1.3
                        : 1.4,
                    fontWeight: FontWeight.w500),
              ),
            ),
            getTabbar(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 1.7,
              child: TabBarView(children: [
                TabPerView(
                  url: "assets/a1.mp4",
                  title: AppLocalizations.of(context)!.fast,
                  body: AppLocalizations.of(context)!.fast_body,
                  color: const Color.fromARGB(255, 20, 194, 173),
                ),
                TabPerView(
                    url: "assets/a2.mp4",
                    title: AppLocalizations.of(context)!.productive,
                    body: AppLocalizations.of(context)!.productive_body,
                    color: const Color.fromARGB(255, 131, 62, 242)),
                TabPerView(
                    url: "assets/a3.mp4",
                    title: AppLocalizations.of(context)!.flexible,
                    body: AppLocalizations.of(context)!.flexible_body,
                    color: const Color.fromARGB(255, 242, 93, 80)),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget getTabbar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TabBar(
          unselectedLabelColor: const Color.fromARGB(255, 4, 104, 215),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 4, 104, 215)),
          tabs: [
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(AppLocalizations.of(context)!.fast,
                      style: GoogleFonts.notoSans(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(AppLocalizations.of(context)!.productive,
                      style: GoogleFonts.notoSans(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            Tab(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(AppLocalizations.of(context)!.flexible,
                      style: GoogleFonts.notoSans(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ]),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        ref.watch(localeProvider.state).state = const Locale("en");
        break;
      case 1:
        ref.watch(localeProvider.state).state = const Locale("my");
        break;
      case 2:
    }
  }
}
