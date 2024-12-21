import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Balancestatus extends StatefulWidget {
  final double value;
  const Balancestatus({super.key, required this.value});

  @override
  State<Balancestatus> createState() => _BalancestatusState();
}

class _BalancestatusState extends State<Balancestatus> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double animatedValue = 0.0;

  @override
  void initState() {
    super.initState();

    // Create an animation controller with duration and curve
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Set duration for the animation
    );

    // Define the animation, which will animate from 0 to the actual value
    _animation = Tween<double>(begin: 0, end: widget.value).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Add a listener to update the state when the animation changes
    _animation.addListener(() {
      setState(() {
        animatedValue = _animation.value;
      });
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value = animatedValue;
    Color markerColor = value < 30
        ? const Color(0xFFFF718B)
        : (value < 50
        ? const Color(0xFFFCB5C3)
        : (value < 75
        ? const Color(0xFFFFEB3A)
        : const Color(0xFF7FE47E)));
    String sentence = getBalanceMessage(widget.value);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: SfRadialGauge(
            title: GaugeTitle(
                text: "Score: ${value.round()}", textStyle: BalanceStatusTypography.title),
            axes: <RadialAxis>[
              RadialAxis(
                startAngle: 180,
                endAngle: 0,
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  cornerStyle: CornerStyle.bothFlat,
                  thickness: 10,
                  color: Colors.grey.shade300, // Background arc color
                  thicknessUnit: GaugeSizeUnit.logicalPixel,
                ),
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 30,
                    color: const Color(0xFFFF718B),
                    startWidth: 10,
                    endWidth: 10,
                  ),
                  GaugeRange(
                    startValue: 30,
                    endValue: 50,
                    color: const Color(0xFFFCB5C3),
                    startWidth: 10,
                    endWidth: 10,
                  ),
                  GaugeRange(
                    startValue: 50,
                    endValue: 75,
                    color: const Color(0xFFFFEB3A),
                    startWidth: 10,
                    endWidth: 10,
                  ),
                  GaugeRange(
                    startValue: 75,
                    endValue: 100,
                    color: const Color(0xFF7FE47E),
                    startWidth: 10,
                    endWidth: 10,
                  ),
                ],
                pointers: <GaugePointer>[
                  MarkerPointer(
                    value: value, // Use the animated value here
                    markerHeight: 20,
                    markerWidth: 20,
                    markerType: MarkerType.circle,
                    borderColor: markerColor,
                    borderWidth: 6,
                    color: whiteColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 125,
              ),
              Text(sentence, style: BalanceStatusTypography.title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ],
    );
  }

  // Function to return dynamic message based on balance value
  String getBalanceMessage(double value) {
    if (value >= 85) {
      return "Perfect Balance!";
    } else if (value >= 75) {
      return "You're in a great spot!";
    } else if (value >= 50) {
      return "You're doing well!";
    } else if (value >= 30) {
      return "Caution, you may want to adjust!";
    } else {
      return "Balance is low, consider reviewing!";
    }
  }
}
