import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hewcheehau_test/data/db_server.dart';
import '../models/job.dart';

part 'fetch_job_state.dart';

class FetchJobCubit extends Cubit<FetchJobState> {
  FetchJobCubit() : super(const FetchJobState());

  void jobFetched() async {
    //Fake load from server
    emit(state.copyWith(status: FetchJobStatus.loading));
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      final mydata = DbServer().demoData;
      final dataConverted = mydata
          .map(
            (e) => Job.fromJson(e),
          )
          .toList();
      double total = 0.0;
      for (int i = 0; i < dataConverted.length; i++) {
        total += dataConverted[i].totalFee;
      }
      emit(state.copyWith(
          status: FetchJobStatus.success,
          jobItem: dataConverted,
          total: total));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FetchJobStatus.fail));
    }
  }

  void sortDate() {
    emit(state.copyWith(status: FetchJobStatus.loading));
    state.dateFlat == 0
        ? state.jobItem.sort((a, b) => b.dateTime.compareTo(a.dateTime))
        : state.jobItem.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    emit(state.copyWith(
        jobItem: state.jobItem,
        status: FetchJobStatus.success,
        flat: state.dateFlat == 0 ? 1 : 0));
  }
}
