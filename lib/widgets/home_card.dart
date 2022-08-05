import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hewcheehau_test/constants/app_color.dart';
import 'package:hewcheehau_test/cubits/fetch_job_cubit.dart';
import 'package:hewcheehau_test/util/size_helper.dart';

//To Show Total Earning at Home page
class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: SizeHelper.getWidth() * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total ',
            style: TextStyle(
                fontSize: 17,
                color: AppColors.mainGreenColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: BlocBuilder<FetchJobCubit, FetchJobState>(
                builder: (context, state) {
              if (state.status == FetchJobStatus.success) {
                
                return Text(
                '+ RM ${state.total.toStringAsFixed(2)} / year',
                style: const TextStyle(fontSize: 20),
              );
              }
              return const Text(
                '-',
                style: TextStyle(fontSize: 20),
              );
            }),
          ),
          const Spacer(),
          BlocBuilder<FetchJobCubit, FetchJobState>(
            builder: (context, state) {
              return Text('Job Completed : ${state.jobItem.length}');
            }
          )
        ],
      ),
    );
  }
}
