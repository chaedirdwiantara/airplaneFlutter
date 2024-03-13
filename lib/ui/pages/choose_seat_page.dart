import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
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

    Widget selectSeat() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(children: [
          //NOTE: SEAT INDICATORS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'A',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'B',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    '',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'C',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: Center(
                  child: Text(
                    'D',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //NOTE: SEAT 1
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SeatItem(),
                const SeatItem(),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '1',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SeatItem(),
                const SeatItem(),
              ],
            ),
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [title(), seatStatus(), selectSeat()],
      ),
    );
  }
}
