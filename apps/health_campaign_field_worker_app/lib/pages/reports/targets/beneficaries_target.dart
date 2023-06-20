import 'package:flutter/material.dart';
import 'target.dart';

class BeneficariesTargetPage extends StatefulWidget {
  const BeneficariesTargetPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BeneficariesTargetState();
  }
}

class BeneficariesTargetState extends State<BeneficariesTargetPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LineChartSample2(),
    );
  }
}
