import 'package:flutter/material.dart';

enum classSelection { leaf, fruit }

class AnalyzeBox extends StatelessWidget {
  const AnalyzeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SafeArea(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text("Choose the type of picture:"),
                RadioButton(),
                Text("Choose the species of the plant:"),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SpeciesSelector(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  classSelection? _selection = classSelection.leaf;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Leaf'),
              leading: Radio<classSelection>(
                value: classSelection.leaf,
                groupValue: _selection,
                onChanged: (classSelection? _chosenValue) {
                  setState(() {
                    _selection = _chosenValue;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Fruit'),
              leading: Radio<classSelection>(
                value: classSelection.fruit,
                groupValue: _selection,
                onChanged: (classSelection? _chosenValue) {
                  setState(() {
                    _selection = _chosenValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> list = <String>['apple', 'banana', 'mango', 'jackfruit'];

class SpeciesSelector extends StatefulWidget {
  const SpeciesSelector({super.key});

  @override
  State<SpeciesSelector> createState() => _SpeciesSelectorState();
}

class _SpeciesSelectorState extends State<SpeciesSelector> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ),
    );
  }
}
