import 'package:flutter/material.dart';
import 'package:flutter_web_api_v1/screens/home_screen/home_screen.dart';
import 'package:flutter_web_api_v1/services/journal_service.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());

  JournalService service = JournalService();
  service.register("Ola mundo");
  // service.get();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        // textTheme: GoogleFonts.bitterTextTheme(),
        // textTheme: TextTheme(),
        fontFamily: "Bitter",
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
      },
    );
  }
}
