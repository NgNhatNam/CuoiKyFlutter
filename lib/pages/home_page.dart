import 'package:app_cuoiki/models/images_item.dart';
import 'package:app_cuoiki/models/models.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

   void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu, color: AppColor.white,),
          onPressed: () {},
        ),
        title: const Text(
          'Ngốc', style: TextStyle(color: AppColor.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            tooltip: 'Favorites',
            icon: const Icon(
              Icons.favorite,
              color: AppColor.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(
              Icons.search,
              color: AppColor.white,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text(
                    'Nhất',
                  ),
                ),
                const PopupMenuItem(
                  child: Text(
                    'Nhì'
                  ),
                ),
                const PopupMenuItem(
                  child: Text(
                    'Ba'
                  ),
                ),
              ];
            },
          )
        ],
      ),

        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
            top: MediaQuery.of(context).padding.top + 24.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Stories in ur life',
                style: TextStyle(color: AppColor.white, fontSize: 28.0),
              ),
              const SizedBox(height: 40.0),
              Item(ngoc[0]),
              const SizedBox(height: 40.0),
              Item(ngoc[1]),
              const SizedBox(height: 40.0),
              Item(ngoc[2]),
              const SizedBox(height: 40.0),
              Item(ngoc[3]),
              const SizedBox(height: 40.0),
              Item(ngoc[4]),
              const SizedBox(height: 40.0),
              Item(ngoc[5]),
            ],
          ),
        ),
      ),
      /* bottomNavigationBar: , */
    );
    
  }
}