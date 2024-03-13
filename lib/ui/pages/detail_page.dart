import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image_destination1.png'),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ]),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(children: [
          // NOTE: EMBLLEM
          Container(
            width: 108,
            height: 24,
            margin: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_emblem.png',
                ),
              ),
            ),
          ),

          // NOTE: TITLE
          Container(
            margin: const EdgeInsets.only(top: 256),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lake Ciliwung',
                      style: whiteTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Tangerang',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      '4.5',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    )
                  ]),
            ]),
          ),

          // NOTE: DESCRTIPTION
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: ABOUT
                Text(
                  'About',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Berada di jalur jalan profivinsi yang menghubungkan Denpasar Singaraja serta letaknya yanbg dekat dengan Kebun Raya Eka Karya menjadikan tembat Bali. ',
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular, height: 2),
                ),

                //  NOTE: PHOTOS
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Photos',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    PhotoItem(
                      imageUrl: 'assets/image_photo1.png',
                    ),
                    PhotoItem(imageUrl: 'assets/image_photo2.png'),
                    PhotoItem(imageUrl: 'assets/image_photo3.png'),
                  ],
                ),

                // NOTE: INTERESTS
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Interest',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    InterestItem(text: 'Kids Park'),
                    InterestItem(text: 'Honor Bridge'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    InterestItem(text: 'City Museum'),
                    InterestItem(text: 'Central Mall'),
                  ],
                )
              ],
            ),
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          customShadow(),
          content(),
        ],
      ),
    );
  }
}
