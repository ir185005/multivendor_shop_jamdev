import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:multivendor_shop_jamdev/widgets/banner_widget.dart';
import 'package:multivendor_shop_jamdev/widgets/brand_highlights.dart';
import 'package:multivendor_shop_jamdev/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.blue.shade900,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Shop App',
              style: TextStyle(letterSpacing: 2),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyLight.buy,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade900,
        body: ListView(
          children: const [
            SearchWidget(),
            SizedBox(height: 10),
            BannerWidget(),
            BrandHighLights(),
            CategoryWidget(),
          ],
        ));
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  // contentPadding: EdgeInsets.fromLTRB(
                  //   8,
                  //   5,
                  //   8,
                  //   8,
                  // ),
                  hintText: 'Search in Shop App',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Icon(
                    IconlyLight.infoSquare,
                    size: 12,
                    color: Colors.white,
                  ),
                  Text(
                    ' 100% Genuine',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    IconlyLight.infoSquare,
                    size: 12,
                    color: Colors.white,
                  ),
                  Text(
                    ' 4-7 Days Return',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    IconlyLight.infoSquare,
                    size: 12,
                    color: Colors.white,
                  ),
                  Text(
                    ' Trusted Brands',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
