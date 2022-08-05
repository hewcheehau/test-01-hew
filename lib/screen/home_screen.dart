import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hewcheehau_test/constants/app_color.dart';
import 'package:hewcheehau_test/constants/string_constants.dart';
import 'package:hewcheehau_test/cubits/fetch_job_cubit.dart';
import 'package:hewcheehau_test/util/size_helper.dart';
import 'package:hewcheehau_test/widgets/home_card.dart';
import 'package:hewcheehau_test/widgets/home_earn_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<FetchJobCubit>().jobFetched();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
              delegate: _HomeSliverHeader(
                  expandedHeight: 250, minHeight: kToolbarHeight)),
          SliverToBoxAdapter(
            child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: kToolbarHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          StringConstants.recentComplete,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.mainGreenColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: () {
                            context.read<FetchJobCubit>().sortDate();
                          },
                          child: const Text(
                            StringConstants.sortByDate,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
          _HomeBodyView()
        ],
      ),
    );
  }
}

class _HomeBodyView extends StatelessWidget {
  const _HomeBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchJobCubit, FetchJobState>(builder: (context, state) {
      if (state.status == FetchJobStatus.fail) {
        return const Center(
          child: Text('Opps, Something went wrong!'),
        );
      }
      if (state.status == FetchJobStatus.success) {
        return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeEarnTile(
              job: state.jobItem[index],
              title: state.jobItem[index].jobTitle,
              fee: state.jobItem[index].totalFee,
              comm: state.jobItem[index].commission,
              dateTime:
                  "${state.jobItem[index].dateTime.year}-${state.jobItem[index].dateTime.month}-${state.jobItem[index].dateTime.day}",
            ),
          );
        }, childCount: state.jobItem.length));
      }
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ),
        ),
      );
    });
  }
}

class _HomeSliverHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight, minHeight;
  const _HomeSliverHeader(
      {required this.expandedHeight, required this.minHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double appBarSize = expandedHeight - shrinkOffset;
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 250,
          child: AppBar(
              backgroundColor: AppColors.mainColor,
              centerTitle: false,
              title: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "My",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    " ${StringConstants.homeTitle}",
                    style: TextStyle(letterSpacing: 0.6),
                  ),
                ],
              )),
        ),
        Positioned(
            bottom: -50,
            child: Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: HomeCardWidget()))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
