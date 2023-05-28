import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uzima/core/const/color_constants.dart';
import 'package:uzima/core/const/path_constants.dart';
import 'package:uzima/core/const/text_constants.dart';
import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';

class HomeStatistics extends StatelessWidget {
  const HomeStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createCompletedWorkouts(context, bloc),
          _createColumnStatistics(bloc),
        ],
      ),
    );
  }

  Widget _createCompletedWorkouts(BuildContext context, HomeBloc bloc) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      height: 200,
      width: screenWidth * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.textBlack.withOpacity(0.12),
            blurRadius: 5.0,
            spreadRadius: 1.1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: const [
              Image(
                image: AssetImage(
                  PathConstants.finished,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  TextConstants.finished,
                  style: TextStyle(
                    color: ColorConstants.textBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ),
            ],
          ),
          Text(
            '${bloc.getFinishedWorkouts()}',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: ColorConstants.textBlack,
            ),
          ),
          const Text(
            TextConstants.completedWorkouts,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorConstants.textGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createColumnStatistics(HomeBloc bloc) {
    return Column(
      children: [
        DataWorkouts(
          icon: PathConstants.inProgress,
          title: TextConstants.inProgress,
          count: bloc.getInProgressWorkouts() ?? 0,
          text: TextConstants.workouts,
        ),
        const SizedBox(height: 20),
        DataWorkouts(
          icon: PathConstants.timeSpent,
          title: TextConstants.timeSpent,
          count: bloc.getTimeSpent() ?? 0,
          text: TextConstants.minutes,
        ),
      ],
    );
  }
}

class DataWorkouts extends StatelessWidget {
  final String icon;
  final String title;
  final int count;
  final String text;

  const DataWorkouts({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 90,
      width: screenWidth * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.textBlack.withOpacity(0.12),
            blurRadius: 5.0,
            spreadRadius: 1.1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image(image: AssetImage(icon)),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.textBlack,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.textBlack,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
