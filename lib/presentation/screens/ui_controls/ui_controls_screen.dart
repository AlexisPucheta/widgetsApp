import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          value: isDeveloperMode,
          subtitle: const Text('Show developer options'),
          onChanged: (value) {
            setState(() {
              isDeveloperMode = value;
            });
          },
        ),
        ExpansionTile(
          enabled: isDeveloperMode,
          title: const Text('Developer Options'),
          subtitle: Text(selectedTransportation.name),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              value: Transportation.car,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
              groupValue: selectedTransportation,
            ),
            RadioListTile(
              title: const Text('By Plane'),
              value: Transportation.plane,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
              groupValue: selectedTransportation,
            ),
            RadioListTile(
              title: const Text('By Boat'),
              value: Transportation.boat,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
              groupValue: selectedTransportation,
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              value: Transportation.submarine,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
              groupValue: selectedTransportation,
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          subtitle: const Text('Do you want breakfast?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = value ?? false;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          subtitle: const Text('Do you want Lunch?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = value ?? false;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Dinner'),
          subtitle: const Text('Do you want Dinner?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
