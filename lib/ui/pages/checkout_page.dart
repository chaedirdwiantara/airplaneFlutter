import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(children: [
          Container(
            width: 291,
            height: 65,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/image_checkout.png',
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CGK',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    'Tangerang',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TLC',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    'Ciliwung',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ],
          )
        ]),
      );
    }

    Widget bookingDetails() {
      return Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: kWhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: DESTINATION TILE
              Row(children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
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
                        transaction.destination.rating.toString(),
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 14),
                      )
                    ]),
              ]),

              // NOTE: BOOKING DETAILS TEXT
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Booking Details',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),

              // NOTE: BOOKING DETAILS ITEMS
              BookingDetailsItem(
                title: 'Traveler',
                valueText: '${transaction.amountOfTraveler} person',
                valueColor: kBlackColor,
              ),
              BookingDetailsItem(
                title: 'Seat',
                valueText: '${transaction.selectedSeats}',
                valueColor: kBlackColor,
              ),
              BookingDetailsItem(
                title: 'Insurance',
                valueText: transaction.insurance ? 'YES' : 'NO',
                valueColor: transaction.insurance ? kGreenColor : kRedColor,
              ),
              BookingDetailsItem(
                title: 'Refundable',
                valueText: transaction.refundable ? 'YES' : 'NO',
                valueColor: transaction.refundable ? kGreenColor : kRedColor,
              ),
              BookingDetailsItem(
                title: 'VAT',
                valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
                valueColor: kBlackColor,
              ),
              BookingDetailsItem(
                title: 'Price',
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.price),
                valueColor: kBlackColor,
              ),
              BookingDetailsItem(
                title: 'Grand Total',
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.grandTotal),
                valueColor: kPrimaryColor,
              ),
            ],
          ));
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image_card.png'),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/icon_plane.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Current Balance',
                                style:
                                    greyTextStyle.copyWith(fontWeight: light),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }

          return SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return CustomButton(
        title: 'Pay Now',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SuccessCheckoutPage(),
            ),
          );
        },
        margin: const EdgeInsets.only(top: 30),
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Text(
          'Terms and Conditions',
          style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton(),
        ],
      ),
    );
  }
}
