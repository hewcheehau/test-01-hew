import 'package:flutter/material.dart';
import 'package:hewcheehau_test/constants/app_color.dart';
import 'package:hewcheehau_test/models/job.dart';
import 'package:hewcheehau_test/screen/earn_detail_screen.dart';

class HomeEarnTile extends StatelessWidget {
  const HomeEarnTile(
      {Key? key, this.title = "", this.fee = 0.00, this.comm = 0.00, this.dateTime = "", required this.job})
      : super(key: key);
  final String title;
  final double fee, comm;
  final String dateTime;
  final Job job;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(EarnDetailScreen.routeName, arguments: job),
      leading: CircleAvatar(
          backgroundColor: AppColors.secondGreenColor,
          child: Text(
            title[0],
            style: const TextStyle(color: Colors.white),
          )),
      title: Text("\$ ${job.totalFee.toStringAsFixed(2)} ${job.commission == 0.00 ? "" : "+ ${job.commission.toStringAsFixed(2)}"}",
              style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 52, 117, 54))),
      trailing: Text(
            dateTime,
            style: const TextStyle(color: Colors.grey),)
    );
  }
}
