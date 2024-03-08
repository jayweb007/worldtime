import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // print(data);

    //set background image
    String bgImg = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime']
        ? Colors.blue[300] as Color
        : Colors.indigo[700] as Color;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                Column(
                  children: [
                    TextButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'location': result['location'],
                              'flag': result['flag'],
                              'time': result['time'],
                              'isDayTime': result['isDayTime'],
                            };
                          });
                        },
                        icon: Icon(
                          Icons.location_pin,
                          color: Colors.grey[100],
                        ),
                        label: const Text(
                          "Edit Location",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['location'],
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 35.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2.0),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      data['time'],
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 66.0,
                        fontWeight: FontWeight.w500,
                        // letterSpacing: 1.0
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
