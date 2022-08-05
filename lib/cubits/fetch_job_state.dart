
part of 'fetch_job_cubit.dart';
enum FetchJobStatus { loading, init, success, fail }

class FetchJobState extends Equatable {
  final List<Job> jobItem;
  final FetchJobStatus status;
  final double total;
  final int dateFlat;
  const FetchJobState(
      {this.jobItem = const [], this.status = FetchJobStatus.init, this.total = 0.0, this.dateFlat = 0});

  FetchJobState copyWith({
    List<Job>? jobItem,
    FetchJobStatus? status,
    double? total,
    int? flat,
  }) {
    return FetchJobState(
        jobItem: jobItem ?? this.jobItem, status: status ?? this.status, total: total ?? this.total, dateFlat: flat ?? dateFlat);
  }

  @override
  List<Object?> get props => [jobItem, total, status, dateFlat];
}
