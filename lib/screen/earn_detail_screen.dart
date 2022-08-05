import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hewcheehau_test/constants/app_color.dart';
import 'package:hewcheehau_test/constants/string_constants.dart';
import 'package:hewcheehau_test/cubits/add_cost_cubit.dart';
import 'package:hewcheehau_test/models/job.dart';

class EarnDetailScreen extends StatelessWidget {
  const EarnDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/earn-detail-screen";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Job?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text(StringConstants.earningDetail),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Job Name:'),
            trailing: Text("${args?.jobTitle}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          ListTile(
            title: const Text('Total Fee (RM):'),
            trailing: Text("${args?.totalFee}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Total Commission (RM):',
            ),
            trailing: Text("${args?.commission}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          ListTile(
            title: const Text('Total Expenses (RM):'),
            trailing: BlocBuilder<AddCostCubit, double>(
              builder: (context, state) {
                return Text("${args!.expenses + state}",
                    style: const TextStyle(fontWeight: FontWeight.bold));
              }
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Net income (RM):'),
            trailing: BlocBuilder<AddCostCubit, double>(
              builder: (context, state) {
                return Text("${args!.getNetIncome() - state}",
                    style: const TextStyle(fontWeight: FontWeight.bold));
              }
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Date:'),
            trailing: Text("${args?.dateTime}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<AddCostCubit, double>(
                  builder: (context, state) {
                    return TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.mainColor),
                        onPressed: () {
                          if (args != null && state > 0.0) {
                            Fluttertoast.showToast(
                                msg: "Expenses already exist, go edit now");
                            return;
                          }
                          _expensesInput(context);
                        },
                        child: const Text(
                          "Add new cost",
                          style: TextStyle(color: Colors.white),
                        ));
                  }
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.mainGreenColor),
                    onPressed: () {
                      _editExpenses(context);
                    },
                    child: const Text(
                      "Edit cost",
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      _expensesDelete(context);
                    },
                    child: const Text(
                      "Delete cost",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _expensesInput(context) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("Add New Cost"),
      content: TextField(
        onChanged: (v) {
          BlocProvider.of<AddCostCubit>(context).addCost(double.tryParse(v) ?? 0.00);
        },
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('Done'))
      ],
    );
  });
}

void _editExpenses(context) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("Edit Expenses"),
      content: TextField(
        onChanged: (v) {
          if (double.tryParse(v)==null) {
            Fluttertoast.showToast(msg: "Invalid amount");
            return;
          }
          if (double.parse(v)<=0) {
            return;
          }
          BlocProvider.of<AddCostCubit>(context).addCost(double.tryParse(v) ?? 0.00);
        },
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('Done'))
      ],
    );
  });
}

void _expensesDelete(context) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text("Are you sure"),
      content: Text('remove your expenses by this job?'),
      actions: [
        TextButton(onPressed: () {
          context.read<AddCostCubit>().addCost(0.00);
          Fluttertoast.showToast(msg: "Remove expenses successfully.");
          Navigator.of(context).pop();
        }, child: Text('Yes')),
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('No'))
      ],
    );
  });
}