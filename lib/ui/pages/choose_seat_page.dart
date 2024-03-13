import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(children: [
          //NOTE: AVAILABLE
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_available.png'),
              ),
            ),
          ),
          Text(
            'Available',
            style: blackTextStyle,
          ),
          //NOTE: SELECTED
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(left: 10, right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_selected.png'),
              ),
            ),
          ),
          Text(
            'Selected',
            style: blackTextStyle,
          ),
          //NOTE: UNAVAILABLE
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(left: 10, right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_unaivalable.png'),
              ),
            ),
          ),
          Text(
            'Unavailable',
            style: blackTextStyle,
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
        ],
      ),
    );
  }
}
