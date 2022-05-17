import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:safe_travels/utils/airbnb.dart';
import 'package:safe_travels/utils/models.dart';
import 'package:safe_travels/utils/tripadvisor.dart';

class ImageListTripAdvisorWidget extends StatelessWidget {
  final List<Destination> destinations;
  @override
  ImageListTripAdvisorWidget({Key? key, required this.destinations});
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider.builder(
      itemCount: destinations.length,
      options: CarouselOptions(
        height: 300,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlay: false,
      ),
      itemBuilder: (ctx, index, realIdx) {
        return TripAdvisorSf(
          //destination: this.tad.destinations[index],
          destination: destinations[index],
          index: index,
        );
      },
    ));
  }
}

class ImageListAirBnbWidget extends StatelessWidget {
  final List<AirBnb> airBnbs;
  @override
  ImageListAirBnbWidget({Key? key, required this.airBnbs});
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider.builder(
      itemCount: airBnbs.length,
      options: CarouselOptions(
        height: 450,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlay: false,
      ),
      itemBuilder: (ctx, index, realIdx) {
        return AirBnbSf(
          //destination: this.tad.destinations[index],
          airBnb: airBnbs[index],
          index: index,
        );
      },
    ));
  }
}
