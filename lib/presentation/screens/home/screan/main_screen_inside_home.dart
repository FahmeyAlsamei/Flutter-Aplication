import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/config/data.dart';
import 'package:untitled3/models/language.dart';
import 'package:untitled3/services/data/api_category.dart';
import 'package:untitled3/services/models/category_model.dart';
import 'package:untitled3/presentation/screens/home/screan/MyDrawer.dart';
import 'package:untitled3/share/widget/service_item.dart';

import '../../../../share/component/constant_compontent/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CategoryProvider _requestsProvider = CategoryProvider();
  int cureentIndex=0;

  final List<dynamic> serviceName=[];
   getAllService() {
     for(var item in AppData.ListCategory){
       serviceName.add(item.Name);

    }
  }

  Widget ShapeForssmatss(Category category, Color color, Function() function) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: function,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            category != null &&
                    category!.image != null &&
                    category!.image!.isNotEmpty
                ? Image.network(
                    category!.image!,
                    // color: color,
                    // size: 30,
                  )
                : Icon(
                    Icons.info,
                    color: color,
                    size: 30,
                  ),
            SizedBox(height: 20,),
            Text(
              category!.Name!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            )
          ]),
        ));
  }

  bool isEngilsh = Language.getData(key: "isDark") != null &&
          Language.getData(key: "isDark")!
      ? true
      : false;

Widget buildFuture(){
  return FutureBuilder(
    future: _requestsProvider.fetchAllCategory(),
      builder:(_,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return buildCirclarIndactator();
      }
      else
            return buildServicesList();
      }

  );

}

  Widget buildCirclarIndactator(){

  return Center(
    child: CircularProgressIndicator(
      color: Colors.amberAccent,
    ),
  );
  }

Widget buildServicesList(){

  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2
      ),
      shrinkWrap: true,
      physics:const ClampingScrollPhysics(),
      itemCount: AppData.ListCategory.length,
      itemBuilder: (context,index){
      // serviceName.clear();
        getAllService();
        return ServiceItem(category: AppData.ListCategory[index],services:serviceName);
      }
  );
}

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Directionality(
      textDirection: isEngilsh ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
          backgroundColor:Color.fromRGBO(240, 207, 187,0.01),
        appBar: AppBar(
          backgroundColor:  MyColor.myYellow.withOpacity(0.8),
            title: Text(isEngilsh ? "YOUR REST" : "راحـتـكـ",style: TextStyle(
                fontSize: isEngilsh ?20:23,
                color: Colors.white,
                fontFamily: 'Anton',
                fontWeight: FontWeight.w800,
                ),),
            centerTitle: true,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu,color: Colors.white,),
                  iconSize: 49,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            )),
        body: Container(
          color: Color.fromRGBO(240, 207, 187,0.2),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
               Container(
                  height: 175,
                  width: double.infinity,
                  child: CarouselSlider(
                    items: [
                      //1st Image of Slider
                      Container(
                       // margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/Tiles.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //2nd Image of Slider
                      Container(
                       // margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/conditioning.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(
                        //margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/conditioning.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //4th Image of Slider
                      Container(
                      // margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/cleanliness.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //5th Image of Slider
                      Container(
                      //  margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Carpentry.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 600),
                      viewportFraction: 0.8,
                      onPageChanged: (int index, CarouselPageChangedReason reason){

                          cureentIndex=index;

                      }
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,

                    decoration: BoxDecoration(
                        color:  cureentIndex==4? MyColor.myYellow:MyColor.myWhite,
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 10,
                    height: 10,

                    decoration: BoxDecoration(
                        color: cureentIndex==3? MyColor.myYellow:MyColor.myWhite,
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 10,
                    height: 10,

                    decoration: BoxDecoration(
                        color:  cureentIndex==2? MyColor.myYellow:MyColor.myWhite,
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 10,
                    height: 10,

                    decoration: BoxDecoration(
                        color:  cureentIndex==1? MyColor.myYellow:MyColor.myWhite,
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 10,
                    height: 10,

                    decoration: BoxDecoration(
                        color:  cureentIndex==0? MyColor.myYellow:MyColor.myWhite,
                        shape: BoxShape.circle
                    ),
                  ),
                ],
              ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    isEngilsh ? "Services" : "الخدمات",
                    // " Services",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Racing_Sans_One',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                buildFuture(),
               //  FutureBuilder(
               //      future: _requestsProvider.fetchAllCategory(),
               //      builder: (_, snapshot) {
               //        // Displaying LoadingSpinner to indicate waiting state
               //        // print(snapshot.data);
               //        // if(snapshot.hasData)
               //        // AppData.MyHospital=snapshot.data as  List<Hospital>;
               //        if (snapshot.connectionState == ConnectionState.waiting) {
               //          return const Center(
               //            child: CircularProgressIndicator(),
               //          );
               //        }
               //        // if (snapshot.stackTrace != null) {
               //        //   return  Center(
               //        //     child: Text(snapshot.stackTrace.toString()),
               //        //   );
               //        // }
               //        else {
               //          return GridView.builder(
               //              gridDelegate:
               //                  const SliverGridDelegateWithFixedCrossAxisCount(
               //                crossAxisCount: 3,
               //                crossAxisSpacing: 15,
               //                mainAxisSpacing: 15,
               //                mainAxisExtent: 120,
               //              ),
               //              padding: const EdgeInsets.all(8),
               //              shrinkWrap: true,
               //              physics: const NeverScrollableScrollPhysics(),
               //              itemCount: AppData.ListCategory.length,
               //              itemBuilder: (_, index) {
               //                return ShapeForssmatss(
               //                    AppData.ListCategory[index],
               //                    // Icons.local_pharmacy_outlined,
               //                    color, () {
               //                  // Navigator.of(context)
               //                  //     .push(MaterialPageRoute(builder: (context) {
               //                  //   return DisplayHospitalList(
               //                  //     isPrssedPharmacyButton: true,
               //                  //   );
               //                  // }));
               //                });
               //              });
               //          // GridView(
               //          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               //          //     crossAxisCount: 3,
               //          //     crossAxisSpacing: 15,
               //          //     mainAxisSpacing: 15,
               //          //     mainAxisExtent: 120,
               //          //   ),
               //          //   padding: const EdgeInsets.all(8),
               //          //   shrinkWrap: true,
               //          //
               //          //   children: [
               //          //     ShapeFormat(
               //          //
               //          //         "Hospitals", Icons.apartment_outlined, color,
               //          //         () {
               //          //       // Navigator.of(context).push(
               //          //       //     MaterialPageRoute(builder: (context)=>DisplayHospitalList())
               //          //       // );
               //          //     }),
               //          //     ShapeFormat("Clinics", Icons.medical_services_outlined,
               //          //         color, () {}),
               //          //     ShapeFormat(
               //          //         "Pharmacy", Icons.local_pharmacy_outlined, color, () {
               //          //       // Navigator.of(context)
               //          //       //     .push(MaterialPageRoute(builder: (context) {
               //          //       //   return DisplayHospitalList(
               //          //       //     isPrssedPharmacyButton: true,
               //          //       //   );
               //          //       // }));
               //          //     }),
               //          //     ShapeFormat(
               //          //         "Find Doctor", Icons.person_outline_outlined, color,
               //          //         () {
               //          //       // Navigator.of(context)
               //          //       //     .push(MaterialPageRoute(builder: (context) {
               //          //       //   return DisplayHospitalList(
               //          //       //     isPrssedDoctorButton: true,
               //          //       //   );
               //          //       // }));
               //          //     }),
               //          //     ShapeFormat(
               //          //         "Medical Radiation", Icons.data_array_outlined, color,
               //          //         () {
               //          //       // Navigator.of(context).push(MaterialPageRoute(
               //          //       //     builder: (context) => DisplayHospitalList(
               //          //       //           isPrssedRadiationButton: true,
               //          //       //         )));
               //          //     }),
               //          //     ShapeFormat("Medical Labortory",
               //          //         Icons.filter_vintage_outlined, color, () {
               //          //       // Navigator.of(context).push(MaterialPageRoute(
               //          //       //     builder: (context) => DisplayHospitalList(
               //          //       //           isPrssedLaboratryButton: true,
               //          //       //         )));
               //          //     }),
               //          //     ShapeFormat("Blood Volunteer",
               //          //         Icons.volunteer_activism_outlined, color, () {
               //          //       // Navigator.of(context).push(MaterialPageRoute(
               //          //       //     builder: (context) => DisplayHospitalList(
               //          //       //           isPrssedBloodVolunteertButton: true,
               //          //       //         )));
               //          //     }),
               //          //     ShapeFormat("Medical Centers", Icons.home_work_outlined,
               //          //         color, () {}),
               //          //     ShapeFormat(
               //          //         "Detention", Icons.favorite_outline, color, () {}),
               //          //   ],
               //          // ),
               //        }
               //      }),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 240,
                )
              ],
            ),
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
