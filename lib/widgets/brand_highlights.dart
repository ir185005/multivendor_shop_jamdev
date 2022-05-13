import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:multivendor_shop_jamdev/firebase_service.dart';
import 'package:multivendor_shop_jamdev/widgets/banner_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BrandHighLights extends StatefulWidget {
  const BrandHighLights({Key? key}) : super(key: key);

  @override
  State<BrandHighLights> createState() => _BrandHighLightsState();
}

class _BrandHighLightsState extends State<BrandHighLights> {
  double _scrollPosition = 0;
  final List _brandAds = [];
  final FirebaseService _service = FirebaseService();
  @override
  void initState() {
    getBrandAd();
    super.initState();
  }

  getBrandAd() {
    return _service.brandAd.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _brandAds.add(doc);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 18),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Brand Highlights',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            height: 166,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: PageView.builder(
              itemCount: _brandAds.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                  height: 100,
                                  color: Colors.deepOrange,
                                  child: YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: _brandAds[index]
                                          ['youtube'],
                                      flags: const YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: true,
                                        controlsVisibleAtStart: true,
                                        loop: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        child: CachedNetworkImage(
                                          imageUrl: _brandAds[index]['image1'],
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              GFShimmer(
                                            child: Container(
                                              height: 50,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                        height: 50,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        child: CachedNetworkImage(
                                          imageUrl: _brandAds[index]['image2'],
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              GFShimmer(
                                            child: Container(
                                              height: 50,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                        height: 50,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            child: CachedNetworkImage(
                              imageUrl: _brandAds[index]['image3'],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => GFShimmer(
                                child: Container(
                                  height: 50,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            height: 160,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              onPageChanged: (val) {
                setState(() {
                  _scrollPosition = val.toDouble();
                });
              },
            ),
          ),
          _brandAds.isEmpty
              ? Container()
              : DotsIndicatorWidget(
                  scrollPosition: _scrollPosition,
                  itemList: _brandAds,
                ),
        ],
      ),
    );
  }
}
