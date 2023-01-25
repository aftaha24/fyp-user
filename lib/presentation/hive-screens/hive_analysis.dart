import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:traceebee_users_app/models/hive_model.dart';
import 'package:traceebee_users_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_users_app/utlis/colors.dart';
import 'package:traceebee_users_app/utlis/text_styles.dart';

class HiveAnalysisScreen extends StatefulWidget {
  final String userName;
  final List<HiveModel> hives;
  const HiveAnalysisScreen({
    Key? key,
    required this.userName,
    required this.hives,
  }) : super(key: key);

  @override
  State<HiveAnalysisScreen> createState() => _HiveAnalysisScreenState();
}

class _HiveAnalysisScreenState extends State<HiveAnalysisScreen> {
  List<List<HiveData>> hiveData = [];

  bool isLoading = false;

  void setList() {
    setState(() => isLoading = true);
    for (int i = 0; i < widget.hives.length; i++) {
      List<HiveData> tempList = [];

      for (var element in widget.hives[i].history) {
        // log(element.toString());
        tempList.add(HiveData(element['date'], int.parse(element['amount'])));
      }
      hiveData.add(tempList);

      // hiveData = List.from(widget.hives.map(
      // (e) => HiveData('Hive ${e.hiveNumber}', int.parse(e.amountHoney!))));

    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    setList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Container(
            height: 300.h,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffBFB0E9),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : hiveData.isEmpty
                    ? Center(
                        child: Text(
                          'No Data',
                          style: headingStyle,
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.hives.length,
                        itemBuilder: (context, index) {
                          return SfCartesianChart(
                            title: ChartTitle(
                                text: 'Hive ${widget.hives[index].hiveNumber!}',
                                textStyle:
                                    const TextStyle(color: Colors.white)),
                            primaryXAxis: CategoryAxis(),
                            series: <ChartSeries<HiveData, String>>[
                              LineSeries<HiveData, String>(
                                  // Bind data source

                                  dataSource: hiveData[index],
                                  xValueMapper: (HiveData sales, _) =>
                                      sales.year,
                                  yValueMapper: (HiveData sales, _) =>
                                      sales.amount)
                            ],
                          );
                        },
                      ),
          ),
          Container(
            height: 300.h,
            width: MediaQuery.of(context).size.width,
            color: lightgreenColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Analaysis of Hives",
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 320.w,
                    child: Text(
                      "Admins can visually see trends at a glance, a graphical representation gives the users a snapshot view of where the honey production of particular user is at.",
                      style: subHeadingStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "​See the hive count and strength trend over the year.",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "Can view the production of honey in each hive.",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ".",
                        style: headingStyle,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "Can compare the production between each hive",
                          style: subHeadingStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HiveData {
  HiveData(this.year, this.amount);
  final String year;
  final int amount;
}
