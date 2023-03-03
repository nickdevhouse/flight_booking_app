import 'package:barcode_widget/barcode_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlightInfoPage extends StatefulWidget {
  const FlightInfoPage({super.key});

  @override
  State<FlightInfoPage> createState() => _FlightInfoPageState();
}

class _FlightInfoPageState extends State<FlightInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          "Flight Infomation",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        // >>> Cloud background
        const CloudBg(),

        // >>> Boeing background
        const BoeingBg(),

        // >>> Flight Ticket
        Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36),
                topRight: Radius.circular(36),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: const [
                      // >>> Flight Schedule
                      FlightSchedule(),
                      SizedBox(height: 20),
                      Divider(color: Colors.grey),
                      SizedBox(height: 20),
                      // >>> Passenger Info
                      PassengerInfo(),
                      SizedBox(height: 40),
                      // >>> Board Info
                      BoardInfo(),
                    ],
                  ),
                ),
                const TicketSegmentLine(),
                const SizedBox(height: 35),
                const TicketBarcode()
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class TicketSegmentLine extends StatelessWidget {
  const TicketSegmentLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 30,
          width: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffE2E4E7),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const DottedLine(dashColor: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 30,
          width: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xffE2E4E7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TicketBarcode extends StatelessWidget {
  const TicketBarcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Scan this barcode!",
          style: TextStyle(
            color: Color(0xff10A5F9),
          ),
        ),
        const SizedBox(height: 30),
        BarcodeWidget(
          barcode: Barcode.code128(),
          data: "Ox12343",
          drawText: false,
          height: 70,
          color: Colors.black87,
        ),
      ],
    );
  }
}

class BoardInfo extends StatelessWidget {
  const BoardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Seat",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "D1",
              style: TextStyle(
                color: Color(0xff262630),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Class",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Economy",
                  style: TextStyle(
                    color: Color(0xff262630),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Gate",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "41",
              style: TextStyle(
                color: Color(0xff262630),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PassengerInfo extends StatelessWidget {
  const PassengerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Passenger",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Text(
              "Jenny Simmmons",
              style: TextStyle(
                color: Color(0xff262630),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FlightSchedule extends StatelessWidget {
  const FlightSchedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "SFO",
                    style: TextStyle(
                      color: Color(0xff10A5F9),
                      fontSize: 34,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "21:30",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
            Expanded(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "------",
                      style: TextStyle(
                        color: Color(0xff10A5F9),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Transform.rotate(
                      angle: math.pi / 2.0,
                      child: const Icon(
                        Icons.flight,
                        color: Color(0xff10A5F9),
                        size: 34,
                      ),
                    ),
                    const Text(
                      "------",
                      style: TextStyle(
                        color: Color(0xff10A5F9),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "5h 25m",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: const [
              Text(
                "NYC",
                style: TextStyle(
                  color: Color(0xff10A5F9),
                  fontSize: 34,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "05:55",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ]),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Sat, 17 August",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BoeingBg extends StatelessWidget {
  const BoeingBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -30,
      right: 50,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/boeing.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CloudBg extends StatelessWidget {
  const CloudBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cloud.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
