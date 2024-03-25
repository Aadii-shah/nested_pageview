import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_bihebari/details.dart';
import 'package:matrimony_bihebari/transformer.dart';

import 'model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//with AutomaticKeepAliveClientMixin<MyHomePage>

class _MyHomePageState extends State<MyHomePage> {
  List<Person> dummyData = [
    Person(
      imageUrl:
          'https://images.unsplash.com/photo-1668554245893-2430d0077217?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGV2ZWxvcGVyfGVufDB8fDB8fHww',
      name: 'John Doe',
      age: 30,
      occupation: 'Software Engineer',
      place: 'New York',
    ),
    Person(
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1663047504447-d54e624ef2d5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z3JhcGhpYyUyMGRlc2lnbnxlbnwwfDF8MHx8fDA%3D',
      name: 'Jane Smith',
      age: 25,
      occupation: 'Graphic Designer',
      place: 'Los Angeles',
    ),
    Person(
      imageUrl:
          'https://images.unsplash.com/photo-1651008376811-b90baee60c1f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG9jdG9yfGVufDB8fDB8fHww',
      name: 'Michael Johnson',
      age: 35,
      occupation: 'Doctor',
      place: 'Chicago',
    ),
    Person(
      imageUrl:
          'https://images.unsplash.com/photo-1613980790147-f4f449df0dd9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGlvcyUyMGRldmVsb3BlcnxlbnwwfDF8MHx8fDA%3D',
      name: 'Aaditya Shah',
      age: 24,
      occupation: 'iOS Developer',
      place: 'Kathmandu',
    ),
    Person(
      imageUrl:
          'https://images.unsplash.com/photo-1605664042212-73d09aa18a96?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bGF3eWVyfGVufDB8MXwwfHx8MA%3D%3D',
      name: 'Dipak Shah',
      age: 30,
      occupation: 'Lawyer',
      place: 'Janakpur',
    ),
    Person(
      imageUrl:
          'https://images.unsplash.com/photo-1575089976121-8ed7b2a54265?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZGV2ZWxvcGVyfGVufDB8MXwwfHx8MA%3D%3D',
      name: 'Sujan Adhikari',
      age: 20,
      occupation: 'React Developer',
      place: 'Lalitpur',
    ),
    Person(
      imageUrl:
          'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fENFT3xlbnwwfDF8MHx8fDA%3D',
      name: 'Hemanta Sah',
      age: 35,
      occupation: 'CEO',
      place: 'Bangalore',
    ),
  ];

  int currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return DefaultTabController(
        length: 2,
        animationDuration: Duration.zero,
        child: Scaffold(
          body: SafeArea(
              child: TabBarView(children: [
            _profile(),
            Details(
              imageUrl: dummyData[currentIndex].imageUrl,
              name: dummyData[currentIndex].name,
            ),
          ])),
        ));
  }

  Widget _profile() {
    return SafeArea(
        key: const PageStorageKey('value'),
        child: TransformerPageView(
            // controller: _pageController,
            itemCount: dummyData.length,
            scrollDirection: Axis.vertical,
            curve: Curves.easeInBack,
            transformer: MyTransformer(),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index ?? 0;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.network(dummyData[index].imageUrl),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${dummyData[index].name}'),
                        Text('Age: ${dummyData[index].age}'),
                        Text('Occupation: ${dummyData[index].occupation}'),
                        Text('Address: ${dummyData[index].place}'),
                      ],
                    ),
                  ),
                ],
              );
            })

        // PageView.builder(
        //   controller: _pageController,
        //   itemCount: dummyData.length,
        //   scrollDirection: Axis.vertical,
        //   onPageChanged: (index) {
        //     setState(() {
        //       currentIndex = index;
        //     });
        //   },
        //   itemBuilder: (context, index) {
        //     //final double horizontalOffset = (index - currentIndex) * 50;
        //     final double verticalOffset = (index - currentIndex) * 50;

        //     // Apply a custom transformation to each page
        //     return TransformerPageView(

        //         scrollDirection: Axis.vertical,
        //         curve: Curves.easeInBack,

        //         transformer: MyTransformer(),
        //         itemCount: dummyData.length,
        //         itemBuilder: (context, index) {
        //           return
        //         });
        //   },
        // ),
        );
  }
}
