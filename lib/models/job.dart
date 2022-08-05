enum JobField {
  accounting,
  admin,
  sales,
  arts,
  services,
  hotels,
  education,
  computer,
  engineering,
  building,
  sciences,
  healthcare,
  others,
}

class Job {
  final String jobTitle;
  final double totalFee, commission;
  final DateTime dateTime;
  double expenses;
  Job(
      {required this.jobTitle,
      required this.totalFee,
      required this.commission,
      this.expenses = 0,
      required this.dateTime});

  Job.fromJson(Map json)
      : jobTitle = json['job_title'],
        totalFee = json['fee'],
        commission = json['commission'],
        dateTime = DateTime.parse(json['date_time']),
        expenses = json['expenses'] ?? 0;

  double getNetIncome() => totalFee - expenses;
  double addExpenses(double newcost) => expenses = newcost;
  double updateExpenses(double newcost) => expenses = newcost;
  double removeExpenses() => expenses = 0.00;
}
