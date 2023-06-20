import 'package:flutter/material.dart';

import '../../widgets/localized.dart';

class BeneficaryTargetPage extends LocalizedStatefulWidget {
  const BeneficaryTargetPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<BeneficaryTargetPage> createState() => _BeneficaryTargetPageState();
}

class _BeneficaryTargetPageState extends State<BeneficaryTargetPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Target List'),
    );
  }
}
