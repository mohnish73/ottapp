import 'package:flutter/material.dart';

import 'downloadScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List<Profiletabs> profiletabs =[
    Profiletabs(tabname: "Manage Profiles", text:""),
    Profiletabs(tabname: "Mobile Number", text: "6396917769"),
    Profiletabs(tabname: "Email", text: "alobha@gmail.com"),
    Profiletabs(tabname: "Subscription", text: "N/A"),
    Profiletabs(tabname: "Downloads", text: ""),
    Profiletabs(tabname: "App Settings", text: ""),
    Profiletabs(tabname: "Help & Legal", text: ""),
    Profiletabs(tabname: "Logout", text: ""),
  ];

  bool subsbutton =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

         body: ListView(
           children: [

           SizedBox(height: 10,),
             appBar,

          SizedBox(
            height: 30,
          ),
             profileImage,

           SizedBox(height: 10,),
             contentSection
         ],),
    );

  }

Widget get appBar=> Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.arrow_back_ios_new,color: Colors.white,),
    Text("Account ",style: TextStyle(fontSize: 20,color: Colors.white),),
    Container(width: 1,)
  ],);

Widget get   profileImage=>ClipRRect(



  child: Image.asset("assets/images/profile.png",width: 120,height: 120,),
);

Widget get contentSection=> ListView.builder(

  itemCount: profiletabs.length,
  shrinkWrap: true,
  itemBuilder: (context, index) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child:
        Column(children: [
          InkWell(
            onTap: (){
            if(index==4){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadScreen(),));
            }

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(profiletabs[index].tabname.toString(),style: TextStyle(fontSize: 16,color: Colors.white), ),
                (index==1 ||index==2)?Text(profiletabs[index].text.toString(),style: TextStyle(color: Colors.grey),): (index==3)?InkWell(
                  onTap: (){
                    setState(() {
                      subsbutton=!subsbutton;
                    });

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: subsbutton==false ? Colors.blue :Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: subsbutton==false ?Text("Subscribe"):Text("Subscribed"),
                    ),
                  ),
                ):
                Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)
              ],
            ),
          ),

          index==profiletabs.length-1? Container():Divider(color: Colors.grey.shade800,)
        ],)
    );
  },);



}

class Profiletabs {
  String ? tabname;
   String   ? text;

  Profiletabs(  {required this.tabname,required this.text});
}