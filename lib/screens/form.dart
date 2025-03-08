import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3/cubit/cubit.dart';
import 'package:task3/cubit/widgetstate.dart';
import 'package:task3/screens/screenmode.dart';
import 'package:task3/stdpixels/stdpixel.dart';

enum Gender {
  None,
  Male,
  Female,
}

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => FormScreentate();
}

class FormScreentate extends State<FormScreen> {
  late double _screenwidth;
  late double _screenheight;
  Gender _gender = Gender.None;
  bool _agree = false;
  @override
  Widget build(BuildContext context) {
    _screenwidth = MediaQuery.of(context).size.width;
    _screenheight = MediaQuery.of(context).size.height;
    Pixel _pixel =
        Pixel(screenheight: _screenheight, screenwidth: _screenwidth);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 21 * _pixel.verticalpixel(),
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'User Form',
          style: GoogleFonts.poppins(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontWeight: FontWeight.w700,
              fontSize: 14.5 * _pixel.horizontalpixel()),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5 * _pixel.horizontalpixel()),
            child: Transform.scale(
              scale: 1.4,
              child: BlocBuilder<CubitThemeState, ThemeMode>(
                builder: (context, state) {
                  return Switch(
                      activeColor: Colors.green,
                      inactiveThumbColor: Color.fromRGBO(217, 217, 217, 1),
                      thumbColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(WidgetState.selected)) {
                            return Color.fromRGBO(247, 235, 218, 1);
                          }
                          return Color.fromRGBO(247, 235, 218, 1);
                        },
                      ),
                      value: Screenmode.MODE,
                      onChanged: (val) {
                        Screenmode.MODE = !Screenmode.MODE;
                        if (state == ThemeMode.light) {
                          context.read<CubitThemeState>().dark();
                        } else {
                          context.read<CubitThemeState>().light();
                        }
                      });
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5 * _pixel.horizontalpixel()),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => CubitFirstnamevalidation(),
                child: Container(
                  margin: EdgeInsets.only(top: 31 * _pixel.verticalpixel()),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0, 0))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: BlocBuilder<CubitFirstnamevalidation,
                      Firstnamevalidation>(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (value) {
                          if (validatename(value) == false) {
                            context.read<CubitFirstnamevalidation>().invalid();
                          } else {
                            context.read<CubitFirstnamevalidation>().valid();
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Enter your first name",
                            hintStyle: GoogleFonts.poppins(
                                color: Color.fromRGBO(134, 119, 119, 1),
                                fontSize: 9 * _pixel.horizontalpixel()),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (state is Validfirstname)
                                        ? Theme.of(context).primaryColor
                                        : Colors.red),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (state is Validfirstname)
                                        ? Theme.of(context).primaryColor
                                        : Colors.red),
                                borderRadius: BorderRadius.circular(15))),
                      );
                    },
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => Cubilastnamevalidation(),
                child: Container(
                  margin: EdgeInsets.only(top: 31 * _pixel.verticalpixel()),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0, 0))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: BlocBuilder<Cubilastnamevalidation,Lastnamevalidation >(
                    builder: (context, state) {
                      return TextField(
                        onChanged: (value) {
                          if (validatename(value) == false) {
                            context.read<Cubilastnamevalidation>().invalid();
                          } else {
                            context.read<Cubilastnamevalidation>().valid();
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Enter your last name",
                            hintStyle: GoogleFonts.poppins(
                                color: Color.fromRGBO(134, 119, 119, 1),
                                fontSize: 9 * _pixel.horizontalpixel()),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: (state is Validlastname)
                                        ? Theme.of(context).primaryColor
                                        : Colors.red),
                                borderRadius: BorderRadius.circular(15))),
                      );
                    },
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => CubitGenderState(),
                child: Container(
                  height: 54.33 * _pixel.verticalpixel(),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0, 0))
                      ],
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(top: 31 * _pixel.verticalpixel()),
                  child: BlocBuilder<CubitGenderState, GenderState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.all(2 * _pixel.horizontalpixel()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "male",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12 * _pixel.horizontalpixel(),
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color),
                                ),
                                Radio(
                                    value: Gender.Male,
                                    groupValue: _gender,
                                    onChanged: (val) {
                                      _gender = val!;
                                      context.read<CubitGenderState>().male();
                                    })
                              ],
                            ),
                          ),
                          SizedBox(height: 8 * _pixel.verticalpixel()),
                          Padding(
                            padding:
                                EdgeInsets.all(2 * _pixel.horizontalpixel()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "female",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12 * _pixel.horizontalpixel(),
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color),
                                ),
                                Radio(
                                    value: Gender.Female,
                                    groupValue: _gender,
                                    onChanged: (val) {
                                      _gender = val!;
                                      context.read<CubitGenderState>().female();
                                    })
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocProvider(
                  create: (context) => CubitCheckBoxState(),
                  child: Container(
                    margin: EdgeInsets.only(top: 20 * _pixel.verticalpixel()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BlocBuilder<CubitCheckBoxState, CheckBoxState>(
                          builder: (context, state) {
                            return Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  splashRadius: 20,
                                  value: _agree,
                                  onChanged: (val) {
                                    if (state is TrueState) {
                                      _agree = !_agree;
                                      context
                                          .read<CubitCheckBoxState>()
                                          .truemark();
                                    } else {
                                      _agree = !_agree;
                                      context
                                          .read<CubitCheckBoxState>()
                                          .nonemark();
                                    }
                                  }),
                            );
                          },
                        ),
                        Text(
                          "by clicking this box this mean\n you agree to all terms",
                          style: GoogleFonts.poppins(
                            fontSize: 10 * _pixel.horizontalpixel(),
                            color: Color.fromRGBO(134, 119, 119, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20 * _pixel.verticalpixel()),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        fixedSize: Size(
                          124.27 * _pixel.horizontalpixel(),
                          22.05 * _pixel.verticalpixel(),
                        )),
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.5 * _pixel.horizontalpixel()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validatename(String name) {
    RegExp nameRegExp = RegExp(r"^[A-Za-z][A-Za-z'-]{1,29}$");
    return nameRegExp.hasMatch(name);
  }
}
