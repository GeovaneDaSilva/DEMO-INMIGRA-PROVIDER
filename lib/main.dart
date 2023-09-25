// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'core/screens/Splash_screen/splash_screen.dart';

// // ignore: unused_import
// import 'package:flutter_dotenv/flutter_dotenv.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: "environment/.env");
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);


//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     const MaterialColor primaryColor = MaterialColor(
//       0xFFFF4081, // change the primary color value to pink (e.g. 0xFFFF4081)
//       <int, Color>{
//         50: Color(0xFFFFF1F8),
//         100: Color(0xFFFFD4E4),
//         200: Color(0xFFFFA1BE),
//         300: Color(0xFFFF6D99),
//         400: Color(0xFFFF4E7A),
//         500: Color(0xFFFF4081),
//         600: Color(0xFFFF3778),
//         700: Color(0xFFFF2D6F),
//         800: Color(0xFFFF2366),
//         900: Color(0xFFFF1356),
//       },
//     );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Inmigra App',
//       theme: ThemeData(
//         primarySwatch: primaryColor,
//       ),
//       supportedLocales: const [
//         Locale("af"),
//         Locale("am"),
//         Locale("ar"),
//         Locale("az"),
//         Locale("be"),
//         Locale("bg"),
//         Locale("bn"),
//         Locale("bs"),
//         Locale("ca"),
//         Locale("cs"),
//         Locale("da"),
//         Locale("de"),
//         Locale("el"),
//         Locale("en"),
//         Locale("es"),
//         Locale("et"),
//         Locale("fa"),
//         Locale("fi"),
//         Locale("fr"),
//         Locale("gl"),
//         Locale("ha"),
//         Locale("he"),
//         Locale("hi"),
//         Locale("hr"),
//         Locale("hu"),
//         Locale("hy"),
//         Locale("id"),
//         Locale("is"),
//         Locale("it"),
//         Locale("ja"),
//         Locale("ka"),
//         Locale("kk"),
//         Locale("km"),
//         Locale("ko"),
//         Locale("ku"),
//         Locale("ky"),
//         Locale("lt"),
//         Locale("lv"),
//         Locale("mk"),
//         Locale("ml"),
//         Locale("mn"),
//         Locale("ms"),
//         Locale("nb"),
//         Locale("nl"),
//         Locale("nn"),
//         Locale("no"),
//         Locale("pl"),
//         Locale("ps"),
//         Locale("pt"),
//         Locale("ro"),
//         Locale("ru"),
//         Locale("sd"),
//         Locale("sk"),
//         Locale("sl"),
//         Locale("so"),
//         Locale("sq"),
//         Locale("sr"),
//         Locale("sv"),
//         Locale("ta"),
//         Locale("tg"),
//         Locale("th"),
//         Locale("tk"),
//         Locale("tr"),
//         Locale("tt"),
//         Locale("uk"),
//         Locale("ug"),
//         Locale("ur"),
//         Locale("uz"),
//         Locale("vi"),
//         Locale("zh")
//       ],
//       localizationsDelegates: const [
//         CountryLocalizations.delegate,
//       ],
//       home: const SplashScreen(),
//       builder: EasyLoading.init(),
//     );
//   }
// }
















// ignore_for_file: prefer_const_constructors

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'authentication/cubit/authentication_cubit.dart';
import 'core/screens/Splash_screen/splash_screen.dart';

// ignore: unused_import
import 'package:flutter_dotenv/flutter_dotenv.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "environment/.env");
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key,);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const MaterialColor primaryColor = MaterialColor(
      0xFFFF4081, // change the primary color value to pink (e.g. 0xFFFF4081)
      <int, Color>{
        50: Color(0xFFFFF1F8),
        100: Color(0xFFFFD4E4),
        200: Color(0xFFFFA1BE),
        300: Color(0xFFFF6D99),
        400: Color(0xFFFF4E7A),
        500: Color(0xFFFF4081),
        600: Color(0xFFFF3778),
        700: Color(0xFFFF2D6F),
        800: Color(0xFFFF2366),
        900: Color(0xFFFF1356),
      },
    );
  
    return MultiBlocProvider(
      
      providers: [
        BlocProvider(create: ( _ ) =>  AuthenticationCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inmigra App',
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        supportedLocales: const [
          Locale("af"),
          Locale("am"),
          Locale("ar"),
          Locale("az"),
          Locale("be"),
          Locale("bg"),
          Locale("bn"),
          Locale("bs"),
          Locale("ca"),
          Locale("cs"),
          Locale("da"),
          Locale("de"),
          Locale("el"),
          Locale("en"),
          Locale("es"),
          Locale("et"),
          Locale("fa"),
          Locale("fi"),
          Locale("fr"),
          Locale("gl"),
          Locale("ha"),
          Locale("he"),
          Locale("hi"),
          Locale("hr"),
          Locale("hu"),
          Locale("hy"),
          Locale("id"),
          Locale("is"),
          Locale("it"),
          Locale("ja"),
          Locale("ka"),
          Locale("kk"),
          Locale("km"),
          Locale("ko"),
          Locale("ku"),
          Locale("ky"),
          Locale("lt"),
          Locale("lv"),
          Locale("mk"),
          Locale("ml"),
          Locale("mn"),
          Locale("ms"),
          Locale("nb"),
          Locale("nl"),
          Locale("nn"),
          Locale("no"),
          Locale("pl"),
          Locale("ps"),
          Locale("pt"),
          Locale("ro"),
          Locale("ru"),
          Locale("sd"),
          Locale("sk"),
          Locale("sl"),
          Locale("so"),
          Locale("sq"),
          Locale("sr"),
          Locale("sv"),
          Locale("ta"),
          Locale("tg"),
          Locale("th"),
          Locale("tk"),
          Locale("tr"),
          Locale("tt"),
          Locale("uk"),
          Locale("ug"),
          Locale("ur"),
          Locale("uz"),
          Locale("vi"),
          Locale("zh")
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
        ],
        home: const SplashScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
