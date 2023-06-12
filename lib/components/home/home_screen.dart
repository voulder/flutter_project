import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../profile/profile.dart';

import '../../app/app.dart';


/// HomeScreen of the application.

///

/// Provides Navigation to various pages in the application and maintains their

/// state.

///

/// Default first page is [TimelinePage].

class HomeScreen extends StatefulWidget {

  /// Creates a new [HomeScreen]

  const HomeScreen({Key? key}) : super(key: key);


  /// List of pages available from the home screen.

  static const List<Widget> _homePages = <Widget>[

    Center(child: Text('TimelinePage')),

    Center(child: Text('SearchPage')),

    ProfilePage(),

  ];


  @override

  _HomeScreenState createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {

  final PageController pageController = PageController();


  @override

  Widget build(BuildContext context) {

    final iconColor = Theme.of(context).appBarTheme.iconTheme!.color!;

    return Scaffold(

      appBar: AppBar(

        title:

            Text('Stream-agram', style: GoogleFonts.grandHotel(fontSize: 32)),

        elevation: 0,

        centerTitle: false,

      ),

      body: PageView(

        controller: pageController,

        physics: const NeverScrollableScrollPhysics(),

        children: HomeScreen._homePages,

      ),

      bottomNavigationBar: _StreamagramBottomNavBar(

        pageController: pageController,

      ),

    );

  }

}


class _StreamagramBottomNavBar extends StatefulWidget {

  const _StreamagramBottomNavBar({

    Key? key,

    required this.pageController,

  }) : super(key: key);


  final PageController pageController;


  @override

  State<_StreamagramBottomNavBar> createState() =>

      _StreamagramBottomNavBarState();

}


class _StreamagramBottomNavBarState extends State<_StreamagramBottomNavBar> {

  void _onNavigationItemTapped(int index) {

    widget.pageController.jumpToPage(index);

  }


  @override

  void initState() {

    super.initState();

    widget.pageController.addListener(() {

      setState(() {});

    });

  }


  @override

  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(

        boxShadow: <BoxShadow>[

          BoxShadow(

            color: (Theme.of(context).brightness == Brightness.dark)

                ? AppColors.ligthGrey.withOpacity(0.5)

                : AppColors.faded.withOpacity(0.5),

            blurRadius: 1,

          ),

        ],

      ),

      child: BottomNavigationBar(

        onTap: _onNavigationItemTapped,

        showSelectedLabels: false,

        showUnselectedLabels: false,

        elevation: 0,

        iconSize: 28,

        currentIndex: widget.pageController.page?.toInt() ?? 0,

        items: const [

          BottomNavigationBarItem(

            icon: Icon(Icons.home_outlined),

            activeIcon: Icon(Icons.home),

            label: 'Home',

          ),

          BottomNavigationBarItem(

            icon: Icon(CupertinoIcons.search),

            activeIcon: Icon(

              Icons.search,

              size: 22,

            ),

            label: 'Search',

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.person_outline),

            activeIcon: Icon(Icons.person),

            label: 'Person',

          )

        ],

      ),

    );

  }

}