import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'lagos.png');
    await instance.getData();

    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return; // Checks `this.mounted`, not `context.mounted`.

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });

    // print("The Time ==>> ${instance.time}");
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[800],
        body: const Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 100.0,
          ),
        ));
  }
}
