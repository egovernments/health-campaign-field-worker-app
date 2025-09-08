import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomResourceCard extends StatefulWidget {
  const CustomResourceCard({super.key});

  @override
  State<CustomResourceCard> createState() => _CustomResourceCardState();
}

class _CustomResourceCardState extends State<CustomResourceCard> {
  final List<Map<String, dynamic>> resources = [
    {'code': 'SP1', 'name': 'SP1 - Sulfadoxine-Pyrimethamine'},
    {'code': 'SP2', 'name': 'SP2 - Sulfadoxine-Pyrimethamine (Second Dose)'},
    {'code': 'AQ1', 'name': 'AQ1 - Amodiaquine'},
    {'code': 'AQ2', 'name': 'AQ2 - Amodiaquine (Second Dose)'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Resource',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ...resources
                .map((resource) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DigitCard(
                        cardType: CardType.primary,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      resource['name'],
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Code: ${resource['code']}',
                                      style:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Radio<String>(
                                value: resource['code'],
                                groupValue: form.control('resourceCard').value,
                                onChanged: (value) {
                                  form.control('resourceCard').value = value;
                                },
                              ),
                            ],
                          ),
                          if (form.control('resourceCard').value ==
                              resource['code']) ...[
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Quantity:',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ReactiveTextField(
                                    formControlName:
                                        'quantity_${resource['code']}',
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: '0',
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ))
                .toList(),
          ],
        );
      },
    );
  }
}
