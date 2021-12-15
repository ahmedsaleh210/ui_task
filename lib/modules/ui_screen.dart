/*
*********Notice************
Don't Forget add:
google_nav_bar: ^5.0.5
line_icons: ^2.0.0
in pubspec.yaml
*/

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:math';
final List<String> images = [
  "http://www.medicohospital.com/wp-content/uploads/2017/06/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg",
  "https://thumbs.dreamstime.com/z/serious-doctor-isolated-white-22893662.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5Vj0N85_gXdwVwiC7gEGM_4Ua-z1xeSf6bUW_KG4SKiUfdfk27rXzveTF5Gy7HNokl6E&usqp=CAU",
  "https://thumbs.dreamstime.com/b/doctor-holding-pills-26501499.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXcUiuIT7q4V8mA8xnAY77oRVhjLTrqYvU0La3tq9uLkQKOo4hIALZLwlK-POMuGCqgHw&usqp=CAU",
  "https://thumbs.dreamstime.com/b/serious-doctor-gesturing-against-white-background-portrait-male-32062128.jpg",
  "https://images.freeimages.com/images/premium/previews/1560/15603071-serious-doctor-considers-options.jpg",
  "https://thumbs.dreamstime.com/z/serious-doctor-writing-report-18465194.jpg",
  "https://image.freepik.com/free-photo/positive-doctor-recommending-fresh-fruit-young-indian-physician-pointing-finger-at-apple_1262-12872.jpg",
];
final List<String> types = [
  "Anesthesiologists",
  "Dermatologists",
  "Dentist",
  "Endocrinologists",
  "Family Physicians",
  "Gastroenterologists",
  "Hematologists",
  "Nephrologists",
  "Neurologists",
];
Random random = Random();


class UiScreen extends StatelessWidget {


 const UiScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        elevation: 0.0,
        backgroundColor: Colors.white70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Doctors',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
         Padding(
           padding: const EdgeInsets.only(right: 8.0,bottom: 5),
           child: Row(
             children: [
               IconButton(onPressed: () {},
                 icon: const Icon(Icons.announcement_rounded,
                   size: 34.0,
                 ),
                 color: Colors.grey[500],
               ),
             ],
           ),
         )
        ],
      ),
      body: Container(
        color: Colors.white70,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:  [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      cursorColor: Colors.deepPurple,
                    autofocus: false,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      labelStyle: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(25.7),
                      ) ,
                      labelText: 'Search',
                    ),
          ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Material(
                    color: Colors.white,
                      child: IconButton(onPressed: () {},
                      icon: const Icon(Icons.menu,color: Colors.deepPurple,),
                        iconSize: 35.0,
                      )),
                )
              ],
            ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 110,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index) => buildStoryItem(index),
                    itemCount: images.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  color: Colors.white70,
                  child: StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                    itemCount: images.length,
                    itemBuilder: (context,index) => buildImageCard(index,context),
                    staggeredTileBuilder: (int index) =>
                    const StaggeredTile.fit(1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,

                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          rippleColor: Colors.deepPurple[300]!,
          hoverColor: Colors.deepPurple[100]!,
          gap: 8,
          activeColor: Colors.deepPurple,
          iconSize: 45,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.deepPurpleAccent.withOpacity(0.17),
          color: Colors.black,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
              textStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                color: Colors.deepPurple,
                  fontSize: 18
              ),
            ),
            GButton(
              icon: LineIcons.medicalClinic,
              text: 'Doctors',
              textStyle: TextStyle(
                fontWeight: FontWeight.w800,
                  color: Colors.deepPurple,
                fontSize: 18
              ),
            ),
            GButton(
              icon: LineIcons.rocketChat,
              text: 'Chat',
              textStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple,
                  fontSize: 18
              ),
            ),
            GButton(
              icon: LineIcons.userEdit,
              text: 'Edit Profile',
              textStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple,
                  fontSize: 18
              ),
            ),
          ],
        ),
      ),

    );
  }
  Widget buildStoryItem(int index) => SizedBox(
    width: 100,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children:   [
            CircleAvatar(radius: 40.0,
            backgroundImage:NetworkImage(
                images[index],

            ) ,
          ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 7.8,
                backgroundColor: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 5,top: 5),
              child: CircleAvatar(
                radius: 6.7,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0,),
      ],
    ),
  );
  Widget buildImageCard(int index,context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
              child: Image.network(
                images[index],
              ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:14.0,left: 10.0,bottom: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text("Dr.Josef Prew",style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7,top: 5),
                    child: Text(types[index],style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 16.5
                    )),
                  ),
                  Row(
                    children:  [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      const SizedBox(width: 5,),
                      Text('${random.nextInt(500)} Review',style: const TextStyle(fontSize: 15),)
                    ],
                  )
                ],
              ),


            ),
          ],
        ),
    ),
  );
}
