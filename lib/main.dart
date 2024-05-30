import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hotels Booking',
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchSection(),
              HotelsSection(),
            ],
          ),
        ));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: null,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
      ),
      title: const Text(
        'Explore',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
      actions: [
        Icon(
          Icons.favorite_outline_rounded,
          color: Colors.grey[800],
          size: 20,
        ),
        Icon(
          Icons.place,
          color: Colors.grey[800],
          size: 20,
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: 'London',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: d_green),
                  child: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('12 Dec - 21 Dec'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Rooms',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('1 Room - 2 Adults'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HotelsSection extends StatelessWidget {
  final List hotelList = [
    {
      'name': 'Grand Royl Hotel',
      'place': 'Webbly London',
      'distance': 2,
      'review': 36,
      'picture': 'images/image1.jpg',
      'price': '180'
    },
    {
      'name': 'Queen Hotel',
      'place': 'Webbly London',
      'distance': 3,
      'review': 16,
      'picture': 'images/image2.jpg',
      'price': '240'
    },
    {
      'name': 'Hilton',
      'place': 'Webbly London',
      'distance': 6,
      'review': 120,
      'picture': 'images/image3.jpg',
      'price': '1500'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '530 hotels found',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      'Filters',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: d_green,
                        size: 25,
                      ),
                      onPressed: null,
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;

  HotelCard(this.hotelData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                  image: AssetImage(
                    hotelData['picture'],
                  ),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: d_green,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '\$' + hotelData['price'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['place'],
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: d_green,
                      size: 14,
                    ),
                    Text(
                      hotelData['distance'].toString() + ' km to city',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Text(
                  'per night',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      size: 14,
                      color: d_green,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 14,
                      color: d_green,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 14,
                      color: d_green,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 14,
                      color: d_green,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 14,
                      color: d_green,
                    ),
                    Icon(
                      Icons.star_rate,
                      size: 14,
                      color: d_green,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Text(
                  hotelData['review'].toString() + ' reviews',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
