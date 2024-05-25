import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({Key? key, required this.id, this.isAvailable = true})
      : super(key: key);

  final String id;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatCubit, dynamic>(
      builder: (context, state) {
        bool isSelected = context.read<SeatCubit>().isSelected(id);

        Color backgroundColor() {
          if (!isAvailable) {
            return kUnavailableColor;
          } else {
            if (isSelected) {
              return kPrimaryColor;
            } else {
              return kAvailableColor;
            }
          }
        }

        Color borderColor() {
          if (!isAvailable) {
            return kUnavailableColor;
          } else {
            return kPrimaryColor;
          }
        }

        Widget child() {
          if (isSelected) {
            return Center(
              child: Text(
                'YOU',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        }

        return GestureDetector(
          onTap: () {
            if (isAvailable) {
              context.read<SeatCubit>().selectSeat(id);
            }
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: backgroundColor(),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: borderColor(), width: 2),
            ),
            child: child(),
          ),
        );
      },
    );
  }
}
