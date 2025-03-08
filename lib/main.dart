import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/cubit/cubit.dart';

import 'package:task3/screens/form.dart';
import 'package:task3/screens/homepage.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CubitThemeState()),
      BlocProvider(create: (context) => CubitGenderState()),
      BlocProvider(create: (context) => CubitCheckBoxState()),
    
    ],
    child: BlocProvider(
      create: (context) => CubitThemeState(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  static bool isdark = false;
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitThemeState,ThemeMode >(
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:state,
            theme: ThemeData(
              appBarTheme:AppBarTheme(
                backgroundColor:Color.fromRGBO(255, 225, 202, 0.7),
                foregroundColor:  Color.fromRGBO(0, 0, 0, 1)
              ),
              primaryColor:  Color.fromRGBO(255, 225, 202, 0.7),
              cardColor: Colors.white,
              iconTheme: IconThemeData(color: Color.fromRGBO(102, 102, 102, 1)),
              brightness: Brightness.light,
              textTheme: const TextTheme(
                bodyLarge:
                    TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
                bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            darkTheme: ThemeData(
              cardColor: Colors.black ,
              primaryColor:  Color.fromRGBO(255, 225, 202, 0.7),
              iconTheme:IconThemeData(color: Colors.white),
              brightness: Brightness.dark, // Dark theme settings
              primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[900],
                foregroundColor: Colors.white,
              ),
            ),
            routes: {
              "homepage": (context) => HomePage(),
              "form": (context) => FormScreen(),
            },
            home: HomePage());
      },
    );
  }
}
