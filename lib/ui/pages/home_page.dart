import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy, \nKezia Anne',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Where to fly today?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              DestinationCard(
                name: 'Ciliwoong Lake',
                city: 'Tenggerang',
                imageUrl: 'assets/image_destination1.png',
                rating: 3.0,
              ),
              DestinationCard(
                name: 'White House',
                city: 'Spain',
                imageUrl: 'assets/image_destination2.png',
                rating: 4.7,
              ),
              DestinationCard(
                name: 'Hill Yo',
                city: 'Monaco',
                imageUrl: 'assets/image_destination3.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'Kebon Gede',
                city: 'Japan',
                imageUrl: 'assets/image_destination4.png',
                rating: 5.0,
              ),
              DestinationCard(
                name: 'Patung Aneh',
                city: 'Singapore',
                imageUrl: 'assets/image_destination5.png',
                rating: 2.6,
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularDestinations(),
      ],
    );
  }
}
