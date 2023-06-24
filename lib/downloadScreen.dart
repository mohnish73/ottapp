import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  List<Downloads> downloads=[
    Downloads(images: "assets/images/poster.jpg", vedioname: "Avengers", duration: "2h 28m", expired: ""),
    Downloads(images: "assets/images/poster.jpg", vedioname: "EndGame", duration: "3h 18m", expired: ""),
    Downloads(images: "assets/images/poster.jpg", vedioname: "EndGame", duration: "3h 18m", expired: ""),
    Downloads(images: "assets/images/poster.jpg", vedioname: "EndGame", duration: "3h 18m", expired: "Expired"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      appBar: appBar,

      body:  downloadList



    );
  }

  AppBar get appBar=>AppBar(
    title: Center(child: Text("Downloads")),
    elevation: 0,
    backgroundColor: Colors.black87,
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
    },icon: Icon(Icons.arrow_back_ios),),
    actions: [
      Icon(Icons.delete_outline_outlined,size: 30,)
    ],

  );

  Widget get downloadList=>ListView.builder(
    itemCount: downloads.length,
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {

      return
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(children: [
                Image.asset(downloads[index].images.toString() ,fit: BoxFit.fill,height: 100,width: 180),
                SizedBox(width: 15,),


                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(downloads[index].vedioname.toString(),style: TextStyle(color: Colors.white,fontSize: 16),),
                    SizedBox(height: 10,),

                    Text(downloads[index].duration.toString(),style: TextStyle(color: Colors.white54,fontSize: 12),),
                    SizedBox(height: 5,),

                    (downloads[index].expired=="Expired")? Text("Download Expired",style: TextStyle(color: Colors.redAccent),):
                    Container()
                  ],),

              ],),
              (downloads[index].expired=="Expired")? Icon(Icons.error_outline,color: Colors.redAccent,size: 30,):Icon(Icons.arrow_forward_ios,color: Colors.white,)



            ],),

          SizedBox(height: 30,)
        ],);



    },);
}

class Downloads {
  String ? images;
  String ? vedioname;
  String ? duration;
  String  ?expired;

  Downloads( {
    required this.images, required this.vedioname, required this.duration, required this.expired});


}
