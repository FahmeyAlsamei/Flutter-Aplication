import 'package:flutter/material.dart';
import 'package:untitled3/services/models/category_model.dart';
import 'package:untitled3/share/component/constant_compontent/colors.dart';

import '../../presentation/screens/servece_information/service_info.dart';



class ServiceItem extends StatelessWidget {
  late Category category;
  late List<dynamic> services;
  ServiceItem({required this.category,required this.services});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: EdgeInsets.fromLTRB(6, 6, 6, 6),
       padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white,width:3)

      ),
      child: InkWell(
        onTap: (){
          print(services);
           Navigator.of(context).push(
             MaterialPageRoute(builder: (_)=>ServiceInfo( category.Name!,isServiceNeeder: true,isServiceProvider: false,modifyButtonPressed: false,))
           );
        },
        child: GridTile(

          child: Container(

           child: category.image!.isNotEmpty &&category.image !=null ?
           FadeInImage.assetNetwork(
               width: double.infinity,
               height: double.infinity,
               fit:BoxFit.cover,

               placeholder: "assets/images/load.gif", image: category!.image!
           ):Image.asset('assets/images/f.jpg'),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
            alignment: Alignment.bottomCenter,
            color: Colors.black54,
            child: Text(
              category.Name!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),

        ),

      ),

    );
  }
}
