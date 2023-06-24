import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:ottapplication/test.dart';

import 'models/containuetoWatch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double carousel_index = 0.0;
  double width = 0;

  List <ContainueWatch> containueWatch=[
    ContainueWatch(images: "assets/images/ironman.jpg"),
    ContainueWatch(images: "assets/images/poster.jpg"),
    ContainueWatch(images: "assets/images/poster.jpg"),
    ContainueWatch(images: "assets/images/poster.jpg"),
    ContainueWatch(images: "assets/images/poster.jpg"),
    ContainueWatch(images: "assets/images/poster.jpg"),
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body:
      SingleChildScrollView(
        child: Column(children: [
          appbar,
          sliderSection,
          continueToWatch,
          sports,
          newAndTrending,
          comedy,
          music,
          religiousWisdom,
          technology,
          adventureAndVacations

          
        ],),
      )

    );
  }

  Widget get sliderSection =>

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),

            CarouselSlider.builder(
                itemCount: 4,
                options: CarouselOptions(
                  onPageChanged: (index, position) {
                    setState(() {
                      carousel_index = index.toDouble();
                    });
                  },

                  viewportFraction: 1,
                  aspectRatio: 16 / 9,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlay: true,
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Image.asset("assets/images/poster.jpg",
                  fit:BoxFit.fill,);

                }),

          SizedBox(height: 8,),

            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Text("Endgame | Offical Trailer",style:
                TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2),),
                SizedBox(height: 10,),
                Text("Hindi Triller U/A 16 +",style:
                TextStyle(color: Colors.white54,  fontSize: 12,fontWeight: FontWeight.bold,wordSpacing: 2)
                ),
                SizedBox(height: 10,),

                Bounce(duration: Duration(microseconds: 100),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(),));

                },
                  child: Container(
                    height: 40,width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon (Icons.play_arrow,color: Colors.white,),
                        Text("Watch",style: TextStyle(color: Colors.white),)
                      ],),
                  ),
                ),
              ],),
            ),


            Center(
              child:
              CarouselIndicator(
                count: 4,
                activeColor: Colors.blue,
                color: Colors.blue.shade100,
                width: 30,
                height: 2,
                index: carousel_index.toInt() ,

              ),
            ),







          ],
        );

  Widget get appbar=>

      Padding(
        padding: const EdgeInsets.only(top: 50,left: 10,right: 6),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Icon(Icons.ondemand_video,color: Colors.white,),
                  ),
                )),
            const SizedBox(width: 10,),
            Text("HomeCinema",style: TextStyle(color: Colors.white,fontSize: 14),),
          ],
        ),

        Icon(Icons.search,color: Colors.white,)
  ],),
      );

  Widget get continueToWatch=> Column(children: [
    SizedBox(height: 25,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Continue Watching",style:
      TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
      Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),

    ],),
    SizedBox(height: 5,),

    SizedBox( height: 150,
      child: ListView.builder(
        itemCount: containueWatch.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(


              children : [
                Image.asset(containueWatch[index].images.toString(),fit: BoxFit.fill,width: 200,),
                 Positioned(
                     bottom: 3,
                     child: Container(width: 200  ,
                   child: LinearProgressIndicator(minHeight: 2,
                     color: Colors.red,
                     value: 0.7,
                     valueColor: AlwaysStoppedAnimation(Colors.red) ,),
                 ) ),
                Positioned(
                        left: 100,
                    top: 40,
                    child: Icon(Icons.play_arrow_sharp,color: Colors.grey.shade50,))

              ]
          ),
        );
      },),
    ),


  ],);

  Widget get sports=>Column(children: [
    SizedBox(height: 25,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Sports",style:
        TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),

      ],),
    SizedBox(height: 5,),

    SizedBox( height: 170,
      child: ListView.builder(
        itemCount: containueWatch.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 10,right: 5,top: 10,bottom: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(containueWatch[index].images.toString(),fit: BoxFit.fill,width: 120,)),
          );
        },),
    )
  ],);

  Widget get newAndTrending=> Column(children: [
    SizedBox(height: 25,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("New & Trending",style:
        TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),

      ],),
    SizedBox(height: 5,),

    SizedBox( height: 250,
      child: ListView.builder(
        itemCount: containueWatch.length,
        shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(containueWatch[index].images.toString(),fit: BoxFit.fill,width: 170,)),
          );
        },),
    )
  ],);

  Widget get comedy=>Column(children: [
    SizedBox(height: 25,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Comedy",style:
        TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),

      ],),
    SizedBox(height: 5,),

    SizedBox( height: 170,
      child: ListView.builder(
        itemCount: containueWatch.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(containueWatch[index].images.toString(),fit: BoxFit.fill,width: 120,)),
          );
        },),
    )
  ],);

  Widget get music=>Column(children: [
    SizedBox(height: 25,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Music",style:
        TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),

      ],),
    SizedBox(height: 5,),

    SizedBox( height: 170,
      child: ListView.builder(
        itemCount: containueWatch.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(containueWatch[index].images.toString(),fit: BoxFit.fill,width: 120,)),
          );
        },),
    )
  ],);

  Widget get religiousWisdom=>    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 5,
      ),

      Text("Religious / Wisdom",style:
      TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
      SizedBox(
        height: 10,
      ),
      CarouselSlider.builder(
          itemCount: 4,
          options: CarouselOptions(
            onPageChanged: (index, position) {
              setState(() {
                carousel_index = index.toDouble();
              });
            },

            viewportFraction: 1,
            aspectRatio: 16 / 9,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlay: true,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Image.asset("assets/images/poster.jpg",
              fit:BoxFit.fill,);

          }),

      SizedBox(height: 8,),












    ],
  );

  Widget get technology=>Column(children: [
    SizedBox(height: 25,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Technology",style:
        TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),

      ],),

    SizedBox(height: 5,),

    SizedBox( height: 170,
      child: ListView.builder(
        itemCount: containueWatch.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(containueWatch[index].images.toString(),fit: BoxFit.fill,width: 120,)),
          );
        },),
    )
  ],);

  Widget get adventureAndVacations=>Column(children: [
    SizedBox(height: 25,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Advanture & Vacations",style:
        TextStyle(color: Colors.white,  fontSize: 16,fontWeight: FontWeight.bold,wordSpacing: 2)),
        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,),

      ],),

    SizedBox(height: 5,),

    SizedBox( height: 250,
      child: ListView.builder(
        itemCount: containueWatch.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(containueWatch[index].images.toString(),fit: BoxFit.fill,width: 200,)),
          );
        },),
    )
  ],);



}
