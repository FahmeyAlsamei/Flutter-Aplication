import 'package:flutter/material.dart';
import 'package:untitled3/config/data.dart';
import 'package:untitled3/services/data/api_request.dart';
import 'package:untitled3/share/component/components.dart';

import '../../../../models/language.dart';

class MyAppointment extends StatefulWidget {
  @override
  _MyAppointmentState createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  TextStyle style1 =
      const TextStyle(color: Colors.black, fontWeight: FontWeight.w500);
  final RequestProvider _requestsProvider = RequestProvider();
  bool isReadmore = false;
  int numWord = 3;
  bool isEngilsh=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!;
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    TextStyle style =
        TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 16);
    TextStyle style2 = TextStyle(color: color, fontWeight: FontWeight.w500);

    return Directionality(
      textDirection: isEngilsh?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(

          appBar: AppBar(
            title: Text(isEngilsh?'request':"طلباتي",style: TextStyle(color: Colors.white),),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                FutureBuilder(
                    future: _requestsProvider.fetchAllRequest(),
                    builder: (_, snapshot) {
                      // Displaying LoadingSpinner to indicate waiting state
                      // print(snapshot.data);
                      // if(snapshot.hasData)
                      // AppData.MyHospital=snapshot.data as  List<Hospital>;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // if (snapshot.stackTrace != null) {
                      //   return  Center(
                      //     child: Text(snapshot.stackTrace.toString()),
                      //   );
                      // }
                      else {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: AppData.ListRequest.length,
                          itemBuilder: (context, index) {
                            int? Day = int.tryParse(AppData
                                .ListRequest[index].request_date!
                                .split('-')
                                .last);
                            int? year = int.tryParse(AppData
                                .ListRequest[index].request_date!
                                .split('-')
                                .first);
                            int? month = int.tryParse(AppData
                                .ListRequest[index].request_date!
                                .split('-')[1]);
                            int? hour = int.tryParse(AppData
                                .ListRequest[index].request_time!
                                .split(':')
                                .first);
                            int? minut = int.tryParse(AppData
                                .ListRequest[index].request_time!
                                .split(':')[1]);
                            int? scond = int.tryParse(AppData
                                .ListRequest[index].request_time!
                                .split(':')
                                .last);
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.medical_services_outlined,
                                              size: 20,
                                              color: color,
                                            ),
                                            // Text(
                                            //   "${AppData.ListRequest[index].category!.hospital!.Name}",
                                            //   style: const TextStyle(
                                            //     fontSize: 14,
                                            //     color: Colors.black,
                                            //     fontWeight: FontWeight.w600,
                                            //   ),
                                            // ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Row(
                                          children: [
                                            Icon(
                                              Icons.date_range_outlined,
                                              size: 20,
                                              color: color,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${AppData.ListRequest[index].request_date}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time_outlined,
                                              size: 20,
                                              color: color,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${AppData.ListRequest[index].request_time}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Day! >= DateTime.now().day &&
                                                year! >= DateTime.now().year &&
                                                month! >= DateTime.now().month &&
                                                // AppData.ListRequest[index].isCancel!=null&&
                                                (AppData.ListRequest[index]!
                                                            .isCancel ==
                                                        false ||
                                                    AppData.ListRequest[index]!
                                                            .isCancel ==
                                                        null) &&
                                                AppData.ListRequest[index]
                                                        .isConform ==
                                                    null
                                            //
                                            // hour!
                                            //     <=DateTime.now().hour
                                            // minut!
                                            //     >=DateTime.now().minute&&
                                            // scond!
                                            //     =DateTime.now().second
                                            ? Container(
                                                child: defualtElevatedButton(
                                                  title: "CANCEL",
                                                  function: () {
                                                    setState(() {
                                                      AppData.ListRequest[index]
                                                          .isCancel = true;
                                                    });
                                                    _requestsProvider
                                                        .addIsEventRequest(
                                                            AppData.ListRequest[
                                                                index],
                                                            AppData.ListRequest[
                                                                    index]
                                                                .toJsonIsCansel());
                                                  },
                                                  paddingHorizatal: 19,
                                                  paddingVerical: 40,
                                                  border: 8,
                                                ),
                                              )
                                            : Container(
                                                child: AppData.ListRequest[index]
                                                                .isCancel !=
                                                            null &&
                                                        AppData
                                                                .ListRequest[
                                                                    index]!
                                                                .isCancel ==
                                                            true
                                                    ? const Text(
                                                        "IS Canseld",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.red,
                                                            letterSpacing: 2),
                                                      )
                                                    : AppData.ListRequest[index]
                                                                    .isConform !=
                                                                null &&
                                                            AppData
                                                                    .ListRequest[
                                                                        index]!
                                                                    .isConform ==
                                                                true
                                                        ? const Text(
                                                            "تم الموافقة",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors.red,
                                                                letterSpacing: 1),
                                                          )
                                                        : AppData
                                                                        .ListRequest[
                                                                            index]
                                                                        .isConform !=
                                                                    null &&
                                                                AppData
                                                                        .ListRequest[
                                                                            index]!
                                                                        .isConform ==
                                                                    false
                                                            ? const Text(
                                                                "تم رفض الطلب",
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .red,
                                                                    letterSpacing:
                                                                        1),
                                                              )
                                                            : defualtElevatedButton(
                                                                title: "FINISH .",
                                                                function: () {
                                                                  setState(() {
                                                                    AppData
                                                                        .ListRequest[
                                                                            index]
                                                                        .isFinish = true;
                                                                  });
                                                                  _requestsProvider.addIsEventRequest(
                                                                      AppData.ListRequest[
                                                                          index],
                                                                      AppData
                                                                          .ListRequest[
                                                                              index]
                                                                          .toJsonIsFinish());
                                                                },
                                                                paddingHorizatal:
                                                                    19,
                                                                paddingVerical:
                                                                    40,
                                                                border: 8,
                                                              ),
                                              )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        );
                      }
                    }),
                FutureBuilder(
                    future: _requestsProvider.fetchAllRequestInHospital(),
                    builder: (_, snapshot) {
                      // Displaying LoadingSpinner to indicate waiting state
                      // print(snapshot.data);
                      // if(snapshot.hasData)
                      // AppData.MyHospital=snapshot.data as  List<Hospital>;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // if (snapshot.stackTrace != null) {
                      //   return  Center(
                      //     child: Text(snapshot.stackTrace.toString()),
                      //   );
                      // }
                      else {
                        return ListView.builder(
                          shrinkWrap: true,

                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AppData.ListRequest.length,
                          itemBuilder: (context, index) {
                            int? Day = int.tryParse(AppData
                                .ListRequest[index].request_date!
                                .split('-')
                                .last);
                            int? year = int.tryParse(AppData
                                .ListRequest[index].request_date!
                                .split('-')
                                .first);
                            int? month = int.tryParse(AppData
                                .ListRequest[index].request_date!
                                .split('-')[1]);
                            int? hour = int.tryParse(AppData
                                .ListRequest[index].request_time!
                                .split(':')
                                .first);
                            int? minut = int.tryParse(AppData
                                .ListRequest[index].request_time!
                                .split(':')[1]);
                            int? scond = int.tryParse(AppData
                                .ListRequest[index].request_time!
                                .split(':')
                                .last);
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.medical_services_outlined,
                                            size: 20,
                                            color: color,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${AppData.ListRequest[index].category != null ? AppData.ListRequest[index].category!.Name : ""}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range_outlined,
                                            size: 20,
                                            color: color,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${AppData.ListRequest[index].request_date}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time_outlined,
                                            size: 20,
                                            color: color,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${AppData.ListRequest[index].request_time}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Day! >= DateTime.now().day &&
                                              year! >= DateTime.now().year &&
                                              month! >= DateTime.now().month &&
                                              (AppData.ListRequest[index]!
                                                          .isConform ==
                                                      false ||
                                                  AppData.ListRequest[index]!
                                                          .isConform ==
                                                      null ||
                                                  AppData.ListRequest[index]!
                                                          .isConform ==
                                                      true) &&
                                              // AppData.ListRequest[index].isCancel==null&&
                                              (AppData.ListRequest[index]!
                                                          .isCancel ==
                                                      false ||
                                                  AppData.ListRequest[index]!
                                                          .isCancel ==
                                                      null)
                                          //
                                          // hour!
                                          //     <=DateTime.now().hour
                                          // minut!
                                          //     >=DateTime.now().minute&&
                                          // scond!
                                          //     =DateTime.now().second
                                          ? Container(
                                              child: AppData.ListRequest[index]!
                                                          .isConform ==
                                                      null
                                                  ? Column(
                                                      children: [
                                                        defualtElevatedButton(
                                                          title: " CONFIRM ",
                                                          function: () {
                                                            setState(() {
                                                              AppData
                                                                      .ListRequest[
                                                                          index]
                                                                      .isConform =
                                                                  true;
                                                            });
                                                            _requestsProvider
                                                                .addIsEventRequest(
                                                                    AppData.ListRequest[
                                                                        index],
                                                                    AppData
                                                                        .ListRequest[
                                                                            index]
                                                                        .toJsonIsConfirm());
                                                          },
                                                          paddingHorizatal:
                                                              19 / 2,
                                                          paddingVerical: 40 / 2,
                                                          border: 8,
                                                        ),
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        defualtElevatedButton(
                                                          title: "    DENY    ",
                                                          function: () {
                                                            setState(() {
                                                              AppData
                                                                      .ListRequest[
                                                                          index]
                                                                      .isConform =
                                                                  false;
                                                            });
                                                            _requestsProvider
                                                                .addIsEventRequest(
                                                                    AppData.ListRequest[
                                                                        index],
                                                                    AppData
                                                                        .ListRequest[
                                                                            index]
                                                                        .toJsonIsConfirm());
                                                          },
                                                          paddingHorizatal:
                                                              19 / 2,
                                                          paddingVerical: 40 / 2,
                                                          border: 8,
                                                        ),
                                                      ],
                                                    )
                                                  : Container(),
                                            )
                                          : Container(
                                              child: AppData.ListRequest[index]
                                                              .isCancel !=
                                                          null &&
                                                      AppData.ListRequest[index]!
                                                              .isCancel ==
                                                          true
                                                  ? const Text(
                                                      "IS Canseld",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.red,
                                                          letterSpacing: 2),
                                                    )
                                                  : AppData.ListRequest[index]
                                                                  .isConform !=
                                                              null &&
                                                          AppData
                                                                  .ListRequest[
                                                                      index]!
                                                                  .isConform ==
                                                              true
                                                      ? const Text(
                                                          "تم الموافقة",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              color: Colors.red,
                                                              letterSpacing: 2),
                                                        )
                                                      : AppData.ListRequest[index]
                                                                      .isConform !=
                                                                  null &&
                                                              AppData
                                                                      .ListRequest[
                                                                          index]!
                                                                      .isConform ==
                                                                  false
                                                          ? const Text(
                                                              "تم رفض الطلب",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      Colors.red,
                                                                  letterSpacing:
                                                                      2),
                                                            )
                                                          : defualtElevatedButton(
                                                              title: "FINISH .",
                                                              function: () {
                                                                setState(() {
                                                                  AppData
                                                                      .ListRequest[
                                                                          index]
                                                                      .isFinish = true;
                                                                });
                                                                _requestsProvider.addIsEventRequest(
                                                                    AppData.ListRequest[
                                                                        index],
                                                                    AppData
                                                                        .ListRequest[
                                                                            index]
                                                                        .toJsonIsFinish());
                                                              },
                                                              paddingHorizatal:
                                                                  19,
                                                              paddingVerical: 40,
                                                              border: 8,
                                                            ),
                                            )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        );
                      }
                    })
              ],
            ),
          )),
    );
  }
}
