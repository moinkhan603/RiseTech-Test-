import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:risetech_task/Modals/items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  static List<String> images=[
'assets/images/image1.jpg',
'assets/images/image2.jpg',
'assets/images/image3.jpg'
  ];

  List<Items> going = <Items>[
    Items('Walk in the park','Wednesday, October 14',3),
    Items('Drinks in the pub','Thursday, October 29',3),

  ];


  List<Items> invites = <Items>[
    Items('Bird watching London Wetlands Centre','Saturday, October 10',1),
    Items('Go see Harry Potter at Kings cross','Sunday, October 11',1),
    Items('Blackout Predrinks at the Nags Head','Sunday, October 11',2),
    Items('Rowing in Kingston','Monday, October 12',1),
    Items('Jog in Hyde Park','Sunday, October 18',1),

  ];

  List<Items> favourite = <Items>[
    Items('Bird watching London Wetlands Centre','Saturday, October 10',1),
    Items('Go see Harry Potter at Kings cross','Sunday, October 11',1),
    Items('Blackout Predrinks at the Nags Head','Sunday, October 11',2),
    Items('Blackout Club-Cheap drinks','Monday, October 12',1),
    Items('Rowing in Kingston','Sunday, October 18',1),

  ];



  TextStyle myStyle=TextStyle(color: Colors.black,fontSize: 12);


  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {





    return DefaultTabController(

length: 4,
      child: Scaffold(
bottomNavigationBar: Container(
  height: 55,
  color: Colors.white,
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Icon(Icons.person),
    FaIcon(FontAwesomeIcons.solidCompass),
    Icon(Icons.calendar_today),
    Icon(Icons.people),
    FaIcon(FontAwesomeIcons.solidCommentAlt),

  ],),
),
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(

            indicatorColor: Color(0xffA40000),
            tabs: [
              Tab(
               child: Text('Going (2)'.toUpperCase(),style: myStyle,),
              ),
              Tab(
                child: Text('Hosting (1)'.toUpperCase(),style: myStyle,),
              ),
              Tab(
                child: Text('Invites (5)'.toUpperCase(),style: myStyle,),
              ),

              Tab(

                child: Row(children: <Widget>[
                  Icon(Icons.favorite,color: Color(0xffA40000),),
                  Text("(7)",style: TextStyle(color: Colors.black),)
                ],)
              ),
            ],
          ),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title:
           Text('Your Meetups',style: TextStyle(color: Colors.black),

           ),

          centerTitle: true,
actions: <Widget>[
Icon(Icons.map,color: Colors.black,),
SizedBox(width: 4,),
Padding(
  padding: const EdgeInsets.only(right:8.0),
  child:   PopupMenuButton(

      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.userClock,color: Colors.black,
              size: 15,),
              SizedBox(width: 4,),
              Text("Awaiting host approval"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(

            children: <Widget>[
              FaIcon(FontAwesomeIcons.hourglassStart,color: Colors.black,
              size: 15,),
           SizedBox(width: 4,),
              Text("Past Meetups"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Test Achievements"),
        ),

      ],
      child: Icon(Icons.more_vert,color: Colors.black,)),
)

],

        ),
        body:

        Stack(
          children: <Widget>[
            TabBarView(

              children: [

                ListView.builder(

                  itemCount: going.length,
                    itemBuilder:   (BuildContext ctxt, int index) {
                    String title=going[index].title;
                    String date=going[index].date;
                    return  _customCard(context,FaIcon(FontAwesomeIcons.commentAlt),title,date);
                    }
                ),


          ListTile(

          title: Padding(
          padding: const EdgeInsets.only(top:5.0),
          child: Text('Rounders in the park',),
          ),
          subtitle: Padding(
          padding: const EdgeInsets.only(top:2.0),
    child: Column(

    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(top:8.0),
    child: Row(

    children: <Widget>[

    Icon(Icons.calendar_today,
    size: 15,),
    SizedBox(width: 5,),
    Text('Thursday, October 29',)
    ],),


    ),
    SizedBox(height: 10,),
    Row(

    children: <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          height: 50,

          child: ListView.separated(

              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder:   (BuildContext ctxt, int index) {
                String imgPath=images[index];
                return Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape
                          .circle,
                      image: new DecorationImage(
                        image: new AssetImage(
                            imgPath
                        ),
                        fit: BoxFit.cover,
                      ),
                    ));
              },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 5,
              );
            },

          ),
        ),
      ),

    Expanded(
flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.commentAlt,),
            FaIcon(FontAwesomeIcons.calendarAlt,),

          ],
        )),


    ],),

    Divider(color: Colors.grey,
    indent: 2,
    endIndent: 2,
    )

    ],
    ),
    ),
    ),


                ListView.builder(


    itemCount: invites.length,
    itemBuilder:   (BuildContext ctxt, int index) {

      String title=invites[index].title;
      String date=invites[index].date;
      int count=invites[index].imageCount;

      return  _inviteCard(context,title,date,count);

    }



                  ),


                ListView.builder(

                    itemCount: favourite.length,
                    itemBuilder:   (BuildContext ctxt, int index) {

                      String title=favourite[index].title;
                      String date=favourite[index].date;
                      int count=favourite[index].imageCount;

                      return  _customCard(context,Icon(Icons.favorite,color:Color(0xffA40000)),title,date);

                    }


                )



              ],
            ),
            Positioned.fill(
              bottom: 15,
              right: 15,
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
backgroundColor: Color(0xffA40000),
                  onPressed: (){

                  },
                  child:
                  Icon(Icons.add),),
              ),
            )
          ],

        ),
      ),
    );
  }

  Widget _inviteCard(BuildContext context,title,date,count) {
    return Container(
                color: Colors.white,
                child: ListTile(

                  title: Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Text(title),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top:2.0),
                    child: Column(

                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Row(

                            children: <Widget>[

                              Icon(Icons.calendar_today,
                                size: 15,),
                              SizedBox(width: 5,),
                              Text(date,)
                            ],),


                        ),
                        SizedBox(height: 10,),
                        Row(

                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 50,

                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: count,
                                    itemBuilder:   (BuildContext ctxt, int index) {
                                      String imgPath=images[index];
                                      return Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: new BoxDecoration(
                                            shape: BoxShape
                                                .circle,
                                            image: new DecorationImage(
                                              image: new AssetImage(
                                                  imgPath
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ));
                                    }
,     separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 5,
                                  );
                                },
                                ),
                              ),
                            ),


                            Expanded(
                              flex: 1,
                              child: FlatButton(
                                  child: new Text("CHAT HOST"),
                                  onPressed: ()
                                  {

                                  },

                                  shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),)
                              ),
                            )
                          ],),

                        Divider(color: Colors.grey,
                          indent: 2,
                          endIndent: 2,
                        )

                      ],
                    ),
                  ),
                ),
              );
  }

  Widget _customCard(BuildContext context,icon,title,date) {
    return Container(
                    color: Colors.white,
                    child: ListTile(

                      title: Padding(
                        padding: const EdgeInsets.only(top:5.0),
                        child: Text(title,),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top:2.0),
                        child: Column(

                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Row(

                                children: <Widget>[

                                  Icon(Icons.calendar_today,
                                    size: 15,),
                                  SizedBox(width: 5,),
                                  Text(date,)
                                ],),


                            ),
                            SizedBox(height: 10,),
                            Row(

                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
height: 50,

                                    child: ListView.separated(
 scrollDirection: Axis.horizontal,
    itemCount: images.length,
    itemBuilder:   (BuildContext ctxt, int index) {
      String imgPath=images[index];
      return Container(
          width: 50.0,
          height: 50.0,
          decoration: new BoxDecoration(
            shape: BoxShape
                .circle,
            image: new DecorationImage(
              image: new AssetImage(
                imgPath
                  ),
              fit: BoxFit.cover,
            ),
          ));
    },
                                        separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                  width: 5,
                                  );
                                  },
                                    ),
                                  ),
                                ),


                                Expanded(

                                  flex: 0,

                                    child: icon)
                              ],),

                            Divider(color: Colors.grey,
                              indent: 2,
                              endIndent: 2,
                            )

                          ],
                        ),
                      ),
                    ),
                  );
  }
}
