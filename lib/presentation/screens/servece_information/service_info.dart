
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled3/services/models/category_model.dart';

import '../../../config/data.dart';
import '../../../models/language.dart';
import '../../../models/map/map.dart';
import '../../../services/data/api_services.dart';
import '../../../services/models/services_models.dart';
import '../../../share/component/components.dart';
import 'dart:io';

import '../../../share/component/constant_compontent/colors.dart';
import '../home/screan/appointment.dart';
import '../home/screan/home_screen.dart';
import '../login/login.dart';
import 'package:intl/intl.dart' as intl;
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:location/location.dart';


class ServiceInfo extends StatefulWidget {
  bool isServiceNeeder;
  bool modifyButtonPressed;
  bool isServiceProvider;
  String service_name;


  ServiceInfo(
      this.service_name,
      {this.isServiceNeeder= false,
        this.isServiceProvider= false,


        this.modifyButtonPressed=false ,


      });

  @override
  State<ServiceInfo> createState() => _ServiceInfoState();
}

class _ServiceInfoState extends State<ServiceInfo> {
  final keyform = GlobalKey<FormState>();
  TextEditingController service_type = new TextEditingController();
  TextEditingController product_Name = new TextEditingController();
  TextEditingController product_Phone1 = new TextEditingController();
  TextEditingController product_Phone2 = new TextEditingController();
  TextEditingController product_Address = new TextEditingController();
  TextEditingController product_Addtional_Information =
  new TextEditingController();
  TextEditingController service_date=TextEditingController();
  TextEditingController service_time=TextEditingController();

  bool isEngish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  TapGestureRecognizer _isWorkTime = new TapGestureRecognizer();
  bool? isbackImgFile1;
  bool? isbackImgFile2;
  bool? isbackImgFile3;
  File? backImgFile1;
  File? backImgFile2;
  File? backImgFile3;
  final imgPicker = ImagePicker();

  bool isSave=false;
  String ?err;


  String textEmptyError="can't be empty";
  Category?_selectedValue;

  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool isPressRatingUpdate = false;

  bool isShowMap=false;
  ServicesProvider _servicesProvider=ServicesProvider();
   ServicesModel? servicesModel;
 double sizeBetween=25;

  Future<void> showOptionsDialog({required BuildContext context, required bool isBackImage1,required bool isBackImage2,required bool isBackImage3,}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), side: const BorderSide()),
            backgroundColor: const Color.fromRGBO(234, 235, 243, 1),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openCamera(isBackImage1:isBackImage1, isBackImage2: isBackImage2,isBackImage3: isBackImage3);
                        },
                        label: Text(isEngish?'Image From Camera':"الـصـوره من الكاميره",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: isEngish? 2:0,
                                color: Colors.black)),
                        icon:const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )),
                  const  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openGallery(isBackImage1:isBackImage1, isBackImage2: isBackImage2,isBackImage3: isBackImage3);
                        },
                        label: Text(isEngish?'Image From Gallery':"الـصـوره من الـمـعـرض",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing:isEngish? 2:0,
                                color: Colors.black)),
                        icon:const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: MyColor.myYellow,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )),
                ],
              ),
            ),
          );
        });
  }
  void openCamera({required bool isBackImage1,required bool isBackImage2,required bool isBackImage3,}) async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      if (imgCamera != null) {
        if(isBackImage1){
          backImgFile1 = File(imgCamera.path);
        }
        else if( isBackImage2)
          backImgFile2 = File(imgCamera.path);

        else if( isBackImage3)
          backImgFile3 = File(imgCamera.path);
      }
    });
    Navigator.of(context).pop();
  }

  void openGallery({required bool isBackImage1,required bool isBackImage2,required bool isBackImage3,}) async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (imgGallery != null)
      {
        if(isBackImage1)backImgFile1 = File(imgGallery.path);
        else if( isBackImage2)
          backImgFile2 = File(imgGallery.path);
      else if( isBackImage3)
      backImgFile3 = File(imgGallery.path);
      }
    });
    Navigator.of(context).pop();
  }
  @override
  initState() {
  super.initState();
  service_type.text=widget.service_name;

  //   if(widget.modifyButtonPressed==true && widget.hospital!=null){
  //     product_Name.text=widget.hospital!.Name!;
  //     product_Phone1.text=widget.hospital!.Phone_Number!;
  //     product_Phone2.text=widget.hospital!.Phone_Number_tow!;
  //     product_Address.text=widget.hospital!.location_Name!;
  //     product_Addtional_Information.text=widget.hospital!.Detial_AR!;
  //     widget.worktime=widget.hospital!.Activ_Time!;
  //     //frontImgFile=File(imgPicker.getImage(source: widget.hospital!.images_main!));
  //
  //
  //   }
  //
  //
  }


  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    double mapHeight = MediaQuery.of(context).size.height / 4.round();


    return
      AppData.UserAccountData!=null&&
          AppData.UserAccountData!.id!=null&&
          AppData.UserAccountData!.id!=0?
      Directionality(
        textDirection: isEngish?TextDirection.ltr:TextDirection.rtl,
        child: Scaffold(
          //backgroundColor: Color.fromRGBO(244,245, 250, 1),

            body: Container(
                decoration: defualtBoxDecoration(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Card(
                          elevation: 1,

                          child: Container(
                              height: 45,

                              decoration: BoxDecoration(
                                  color:color,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon:  Icon(
                                        isEnglish?Icons.arrow_forward_ios_outlined:Icons.arrow_back_ios_outlined,
                                        color: Colors.white,
                                      )),
                                  const SizedBox(
                                    width: 75,
                                  ),
                                  Text(widget.isServiceNeeder?isEngish?"Order Service":"طلب خدمة":isEngish?"Provide Service":"مزود خدمة",
                                      style:
                                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white,)),
                                ],
                              )),

                        ),
                      ),

                       SizedBox(
                        height: sizeBetween
                      ),







                      Form(
                          key: keyform,
                          child: Column(
                            children: [
                             widget.isServiceNeeder? defualtTextField(
                                readonly: true,
                                  hinText:service_type.text,

                                  icon: Icons.medical_services_outlined,
                                  myController: service_type,


                                  ):DropdownButtonFormField(
                        value: _selectedValue,

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hint: Text(

                          isEnglish?'Choose Service Type':"اختار نـوع الخددمةالذي بتقدمها ",
                          style:TextStyle(
                            color:  err!=null&&err!.isNotEmpty?Colors.red:Colors.black,
                          ) ,

                        ),


                        onChanged: (value) {
                          // setState(() {
                          //   _selectedValue = value;
                          // });
                        },
                        onSaved: (value) {
                          // setState(() {
                          //   _selectedValue = value;
                          // });
                        },
                        isDense: false,

                        icon: const Icon(Icons.arrow_drop_down_circle),
                        iconDisabledColor: Colors.red,
                        iconEnabledColor:color,
                        isExpanded: true,
                        decoration:InputDecoration(

                            filled: true,
                            fillColor: Colors.white,
                            errorText: err,
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 2,
                                style: BorderStyle.solid,
                                color:  Color.fromRGBO(119, 205, 188, 0.6),),

                            ) ,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.4),



                                )
                            ),

                            contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5)


                        ) ,



                        items:AppData.ListCategory.map((val) {
                          return DropdownMenuItem(
                              value: val,

                              onTap: (){
                                setState((){
                                  _selectedValue=val;
                                  print(_selectedValue);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.medical_services_outlined,color: color,),
                                    const SizedBox(width: 30,),
                                    Text(
                                        val.Name!                                          ),
                                  ],
                                ),
                              )
                          );
                        }).toList(),
                      ),




                               SizedBox(
                                height: sizeBetween
                              ),
                              defualtTextField(

                                  hinText: widget.isServiceNeeder
                                      ? isEngish?"Order Name":"أسم طالب الخدمه "
                                      : isEngish?"Provider Name":"أســم مزود الخدمه",

                                  icon: Icons.apartment_outlined,
                                  myController: product_Name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return isEngish?"Name can't be empty":"الأسـم لايمكن أن يـظل فارغ";
                                    }
                                    return null;
                                  }),
                               SizedBox(
                                height: sizeBetween
                              ),
                              defualtTextField(
                                  hinText: isEngish?"Phone Number 1":"رقـم الـتـلـفـون (المحمول) ",
                                  icon: Icons.phone,
                                  myController: product_Phone1,
                                  inputType: TextInputType.number,

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return isEngish?"Phone Number can't be empty":"رقـم الـتـلـفـون الايمكن ان يـظـل فـارغاَ";
                                    }
                                    else if( product_Phone1.text.length<9){
                                      return isEngish?"Phone Number can't be less than 9 number":"يـجـب أن يــكون الرقـم من 9 أرقام";
                                    }
                                    else if( !product_Phone1.text.startsWith('7')){
                                      return isEngish?"Phone Number must start by 7 ":"يـجـب أن يـبـداء الـرقـم ب 7";
                                    }
                                    return null;
                                  }),
                               SizedBox(
                                height:sizeBetween
                              ),
                              defualtTextField(
                                  hinText: isEngish?"Phone Number 2":"رقـــم الـتـلـفون(الثـابـت)",
                                  icon: Icons.phone_rounded,
                                  myController: product_Phone2,
                                  inputType: TextInputType.number),
                               SizedBox(
                                height: sizeBetween
                              ),
                              defualtTextField(
                                  hinText: isEngish?"Addresses":"الـعـنوان",
                                  icon: Icons.location_on_rounded,
                                  myController: product_Address,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return isEngish?"Address can't be empty":"الـعـنوان لايمكن ان يـظل فـارغ";
                                    }
                                    return null;
                                  }),



                            ],
                          )),
                       SizedBox(
                        height: sizeBetween
                      ),

                      //TODO:Time work here


                      Card(
                        color:Colors.white,
                        child: Container(
                          height:servicesModel!=null&& servicesModel!.latitude !=null &&servicesModel!.latitude!=0  &&servicesModel!.longitude!=null && servicesModel!.longitude!=0?mapHeight!+85:80,
                          padding: const EdgeInsets.only(top: 5,left: 15,right: 15,),
                          decoration: defualtBoxDecoration1(),
                          child: Column(
                            children: [

                              const SizedBox(height: 10,),
                              servicesModel!=null&&servicesModel!.latitude !=null &&servicesModel!.latitude!=0  && servicesModel!.longitude!=null && servicesModel!.longitude!=0?
                              Container(

                                height:  mapHeight!=null?mapHeight!+10:null,


                                child: MapSample(LatLng( servicesModel!.latitude !=null?servicesModel!.latitude!:0,  servicesModel!.longitude!=null?servicesModel!.longitude!:0)),


                              )




                                  :  SizedBox(
                                width: double.infinity,
                                child:   defualtElevatedButtonIcon(
                                    title:  isEnglish?"Add locations":"اضافة الموقع من الخريطه",
                                    function:  () async{
                                      _permissionGranted = await location.hasPermission();
                                      if (_permissionGranted == PermissionStatus.denied) {
                                        _permissionGranted = await location.requestPermission();

                                      }
                                      if (_permissionGranted == PermissionStatus.granted) {

                                        _serviceEnabled = await location.serviceEnabled();
                                        if (!_serviceEnabled)
                                          _serviceEnabled = await location.requestService();
                                        if (!_serviceEnabled) {

                                          return;

                                        }
                                      }




                                    },
                                    background:   color,
                                    paddingHorizatal: 0,
                                    border: 8,
                                    paddingVerical: 0,
                                    icon:Icons.maps_ugc_rounded
                                ),
                              ),
                              servicesModel!=null&&servicesModel!.latitude !=null &&servicesModel!.latitude!=0  && servicesModel!.longitude!=null && servicesModel!.longitude!=0?
                              const SizedBox(height: 15):const SizedBox(height: 5),
                              Row(
                                children: [
                                  servicesModel!=null&&  servicesModel!.latitude !=null &&servicesModel!.latitude!=0  && servicesModel!.longitude!=null && servicesModel!.longitude!=0?
                                  Icon(Icons.map_outlined,color:color):SizedBox(),
                                  servicesModel!=null&& servicesModel!.latitude !=null &&servicesModel!.latitude!=0  && servicesModel!.longitude!=null && servicesModel!.longitude!=0?
                                  Text(isEnglish?'LOCATION IN MAP':"الـعنـوان علي الـخـريـطة",style: TextStyle( fontFamily: 'Anton',
                                    fontWeight:isEnglish?FontWeight.w300:FontWeight.w800,letterSpacing: 0,),):
                                  Container()




                                ],
                              ),


                            ],
                          ),

                        ),
                      ),



                       SizedBox(
                        height:sizeBetween
                      ),

                      widget.isServiceNeeder? defualtTextField(
                          hinText: isEnglish?'Enter Service Date You Want'
                              : 'ادخل تاريخ الخدمة  المراده ',
                          myController: service_date,
                          icon: Icons.calendar_month_outlined,
                          inputType: TextInputType.datetime,


                          readonly: true,
                          onTap: () async{
                            DateTime? pickedDate=  await   showDatePicker(
                                context: context,
                                firstDate: DateTime(2022, 1, 1),
                                initialDate:  DateTime.now(),
                                lastDate: DateTime(2025, 12, 31),
                                builder: defualtTheme

                            );
                            if(pickedDate!=null){
                              String formatPickedDate= intl.DateFormat("yyyy-MM-dd").format(pickedDate);

                              setState((){
                                service_date.text=formatPickedDate;
                              });
                            }
                            else{
                              return;
                            }
                          }):SizedBox(),
                       SizedBox(
                        height: sizeBetween
                      ),
                     widget.isServiceNeeder? defualtTextField(
                          hinText: isEnglish?"Enter Service Time ":"أدخل زمن الخدمة",
                          myController: service_time,
                          icon: Icons.watch_later_outlined,
                          inputType: TextInputType.datetime,
                          readonly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return isEnglish?"Time can't be empty"
                                  : "الرجاء ادخل  وقت الخدمه";
                            }
                            return null;
                          },
                          onTap: () {
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: defualtTheme1)
                                .then((value) {
                              service_time.text =
                                  value!.format(context).toString();
                            });

                          }):SizedBox(),

                       SizedBox(
                        height: sizeBetween
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 4.5,
                             
                             child:  Row(
                               children: [

                                Container(
                                     height: MediaQuery.of(context).size.height / 4.5,
                                     width: MediaQuery.of(context).size.width / 3-18,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(24),
                                         border: Border.all(color: Colors.white, width: 3),

                                         image: DecorationImage(
                                             fit: BoxFit.cover,

                                             image: backImgFile1!=null?FileImage(backImgFile1!, scale: 1)
                                             as ImageProvider
                                                :AssetImage("assets/image/Tiles.png") )),

                                  child: Center(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(width: 3, color: Colors.white),
                                            color: MyColor.myYellow.withOpacity(0.8)
                                        ),
                                        child:  IconButton(
                                          hoverColor:
                                          const Color.fromRGBO(138, 215, 228, 1),
                                          icon:const  Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            showOptionsDialog(context: context,isBackImage1: true , isBackImage2: false, isBackImage3: false);

                                          },
                                        )
                                    ),
                                  ),
                                 ),
                                 SizedBox(width: 7,),

                                   Container(
                                     height: MediaQuery.of(context).size.height / 4.5,
                                     width: MediaQuery.of(context).size.width / 3-18,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(24),
                                         border: Border.all(color: Colors.white, width: 3),

                                         image: DecorationImage(
                                             fit: BoxFit.cover,

                                             image:  backImgFile2!=null?FileImage(backImgFile2!, scale: 1)
                                             as ImageProvider
                                                 :AssetImage("assets/image/Tiles.png"))),
                                     child: Center(
                                       child: Container(
                                           decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               border: Border.all(width: 3, color: Colors.white),
                                               color: MyColor.myYellow.withOpacity(0.8)
                                           ),
                                           child:  IconButton(
                                             hoverColor:
                                             const Color.fromRGBO(138, 215, 228, 1),
                                             icon:const  Icon(
                                               Icons.camera_alt_outlined,
                                               color: Colors.white,
                                               size: 30,
                                             ),
                                             onPressed: () {
                                               showOptionsDialog(context: context,isBackImage1: false , isBackImage2: true, isBackImage3: false);
                                             },
                                           )
                                       ),
                                     ),

                                 ),
                                 SizedBox(width: 7,),
                                 Container(
                                     height: MediaQuery.of(context).size.height / 4.5,
                                     width: MediaQuery.of(context).size.width / 3-18,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(24),
                                         border: Border.all(color: Colors.white, width: 3),

                                         image: DecorationImage(
                                             fit: BoxFit.cover,

                                             image:backImgFile3!=null?FileImage(backImgFile3!, scale: 1)
                                             as ImageProvider
                                                 :AssetImage("assets/image/Tiles.png"))),

                                   child: Center(
                                     child: Container(
                                         decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             border: Border.all(width: 3, color: Colors.white),
                                             color: MyColor.myYellow.withOpacity(0.8)
                                         ),
                                         child:  IconButton(
                                           hoverColor:
                                           const Color.fromRGBO(138, 215, 228, 1),
                                           icon:const  Icon(
                                             Icons.camera_alt_outlined,
                                             color: Colors.white,
                                             size: 30,
                                           ),
                                           onPressed: () {
                                             showOptionsDialog(context: context,isBackImage1: false , isBackImage2: false, isBackImage3: true);
                                           },
                                         )
                                     ),
                                   ),
                                   ),

                               ],
                             )
                            ),



                            // Align(
                            //     alignment: Alignment.bottomLeft,
                            //     child: Container(
                            //         padding: const EdgeInsets.only(
                            //           top: 15,
                            //           bottom: 8,
                            //           left: 25
                            //         ),
                            //         height: (MediaQuery.of(context).size.height / 3) -
                            //             (MediaQuery.of(context).size.height / 4),
                            //         child:IconButton(
                            //           color: Colors.pinkAccent,
                            //           onPressed: (){
                            //             setState((){
                            //               is_favorite =!is_favorite;
                            //             });
                            //           },
                            //
                            //           icon: Icon(is_favorite?Icons.favorite_border_outlined:Icons.favorite_outlined,size: 45,color:Theme.of(context).primaryColor,),
                            //
                            //         ) )),


                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      //TODO:Who we are
                      defualtTextField(
                          hinText: isEngish?"More about service ":"وصــفـ الـخـدمــه ",

                          icon: Icons.add,
                          myController: product_Addtional_Information,
                          numberOfline: 6),
                      const SizedBox(
                        height: 30,
                      ), isSave?
                      CircularProgressIndicator(

                        color: color,
                      ):
                      SizedBox(
                        width: double.infinity,
                        child: defualtElevatedButton(
                            title: isEngish?'SAVE':"حـــفـظ",
                            function: () async {
                              if (keyform.currentState!.validate() && service_type.text.isNotEmpty) {

                                setState((){
                                  isSave=true;
                                });

                                ServicesModel _service=ServicesModel(
                                  Name: product_Name.text,
                                  Phone_Number: product_Phone1.text,
                                  Phone_Number_tow: product_Phone2.text,
                                  location_Name: product_Address.text,




                                );


                                // print(_hospitalNew!.Name);
                                widget.isServiceNeeder?      showDialog(
                                   // barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),

                                        side: const BorderSide(
                                            color: Colors.grey
                                        )

                                    ),
                                    backgroundColor:   MyColor.myGrey,
                                    child: Container(

                                      height: MediaQuery.of(context).size.height/1.3,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 30,),
                                            const Text("وصـل طـلبـك ابشـر بـعـزك",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),


                                            // aboiment.hospital

                                            const SizedBox(height: 20,),
                                            const Text('جاري ربط طـلـبك مع اقرب مزود خدمة من عنوانك '),
                                            const SizedBox(height: 10,),
                                           CircleAvatar(
                                               backgroundColor: MyColor.myYellow,
                                             radius: 120,
                                             child: CircleAvatar(
                                               radius: 100,

                                               backgroundColor: MyColor.myGrey,
                                               child:  Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                   Text("تصفح جوالك و خذ راحتك",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                                                   Text("سوف يصلك اتصال خلال دقائق",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
                                                 ],
                                               )
                                             )
                                               //
                                            ),

                                            const SizedBox(height: 48,),

                                            SizedBox(
                                              width: double.infinity,
                                              child: defualtOutLinedButton(title: "الغاء الطلب  ",
                                                paddingHorizatal:1,
                                                paddingVerical: 20,
                                                border: 8,
                                                isEnglish:isEnglish ,
                                                function: (){
                                                  Navigator.of(context).pushAndRemoveUntil(
                                                      MaterialPageRoute(builder: (context){
                                                        return  MyAppointment();
                                                      })
                                                      , (route) => false);

                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 15,),
                                            SizedBox(
                                              width: double.infinity,
                                              child: defualtElevatedButton(
                                                  title:  "الرئيـسية",
                                                function: (){
                                                  Navigator.of(context).pushAndRemoveUntil(
                                                      MaterialPageRoute(builder: (context){
                                                        return  MyHomePage();
                                                      })
                                                      , (route) => false);

                                                },


                                                  border: 8,
                                                  paddingHorizatal: 40,
                                                  paddingVerical: 20,


                                              ),
                                            ),
                                            const SizedBox(height: 15,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }) :
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context){

                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),

                                              side: const BorderSide(
                                                  color: Colors.grey
                                              )

                                          ),
                                          backgroundColor:    const Color.fromRGBO(234, 235, 243,1),
                                          child: Container(

                                            height:isEngish? MediaQuery.of(context).size.height/3:MediaQuery.of(context).size.height/2.8,

                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10,),
                                                Center(
                                                  child:  Icon(Icons.check_circle,color: color,size: 60,),
                                                ),


                                                const SizedBox(height: 10,),

                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(isEngish? ''' Will try to add information to application as soon as possible after validation process of them. and Thanks'''
                                                      : ''' سوف نحاول قدر الامكان اضافة المعلومات في قائمة مزودين الخدمات الدينا في أقرب وقت ممكن بعد التحقق منها وشكراً''',style: TextStyle(fontSize:isEngish? 14:16,fontWeight: isEngish?FontWeight.w500:FontWeight.w700),textAlign: TextAlign.center,),
                                                ),


                                                const SizedBox(width: 29,),
                                                Center(
                                                  child: defualtElevatedButton(
                                                    title: isEngish? "Agree": " موافق ",
                                                    function: (){
                                                      Navigator.of(context).pushAndRemoveUntil(
                                                          MaterialPageRoute(builder: (context){
                                                            return  MyHomePage();
                                                          })
                                                          , (route) => false);
                                                    },

                                                    border: 8,
                                                    paddingHorizatal: 35,
                                                    paddingVerical: 10,

                                                  ),
                                                ),



                                              ],
                                            ),
                                          ),
                                        );

                                      });




// snackBar.
                                }

                                else{
                                 setState((){
                                   err=" can't be empty";
                                 });
                                  print("_hospitalNew 1");

                                  final snackBar = SnackBar(
                                    content: const Text('فشل عملبة الحفظ الرجاء المحاولة مرة أخرى',),
                                    action: SnackBarAction(
                                      label: 'فشل عملبة الحفظ',
                                      onPressed: () {
                                        // Some code to undo the change.

                                      },
                                    ),
                                  );
                                }



                              },

                            border: 8 //Color.fromRGBO(138, 215, 228, 0.7)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ])

                  ),
                        )

      )
        )
      :const LogIn()

    ;
  }
}
