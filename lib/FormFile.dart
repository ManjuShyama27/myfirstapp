import 'package:flutter/material.dart';

class FormFileScreen extends StatefulWidget {
  const FormFileScreen({super.key});

  @override
  State<FormFileScreen> createState() => _FormFileScreenState();
}

class _FormFileScreenState extends State<FormFileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController trainerName = TextEditingController();
  final TextEditingController email = TextEditingController();

  String? _trainerType;
  final List<String> _preferredTypes = [];
  late DateTime? date = DateTime.now();
  String? _starterPokemon;
  void _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokémon Trainer Application'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: trainerName,
                      decoration: InputDecoration(
                          labelText: 'Trainer Name',
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter your name' : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.contains('@') ? null : 'Enter a valid email',
                    ),
                    SizedBox(height: 16),
                    Text('Trainer Type:'),
                    RadioListTile(
                      title: Text('Casual Trainer'),
                      value: 'Casual',
                      groupValue: _trainerType,
                      onChanged: (value) =>
                          setState(() => _trainerType = value),
                    ),
                    RadioListTile(
                      title: Text('Competitive Trainer'),
                      value: 'Competitive',
                      groupValue: _trainerType,
                      onChanged: (value) =>
                          setState(() => _trainerType = value),
                    ),
                    SizedBox(height: 16),
                    Text('Preferred Pokémon Types:'),
                    CheckboxListTile(
                      title: Text('Fire'),
                      value: _preferredTypes.contains('Fire'),
                      onChanged: (value) => setState(() => value!
                          ? _preferredTypes.add('Fire')
                          : _preferredTypes.remove('Fire')),
                    ),
                    CheckboxListTile(
                      title: Text('Water'),
                      value: _preferredTypes.contains('Water'),
                      onChanged: (value) => setState(() => value!
                          ? _preferredTypes.add('Water')
                          : _preferredTypes.remove('Water')),
                    ),
                    CheckboxListTile(
                      title: Text('Electric'),
                      value: _preferredTypes.contains('Electric'),
                      onChanged: (value) => setState(() => value!
                          ? _preferredTypes.add('Electric')
                          : _preferredTypes.remove('Electric')),
                    ),
                    CheckboxListTile(
                      title: Text('Grass'),
                      value: _preferredTypes.contains('Grass'),
                      onChanged: (value) => setState(() => value!
                          ? _preferredTypes.add('Grass')
                          : _preferredTypes.remove('Grass')),
                    ),
                    SizedBox(height: 16),
                    Text('Date of Birth:'),
                    TextButton(
                      onPressed: () => _pickDate(context),
                      child: Text(date == null
                          ? 'Select Date of Birth'
                          : date!.toLocal().toString().split(' ')[0]),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Starter Pokémon'),
                      value: _starterPokemon,
                      items: ['Pikachu', 'Charmander', 'Bulbasaur', 'Squirtle']
                          .map((pokemon) => DropdownMenuItem(
                                value: pokemon,
                                child: Text(pokemon),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _starterPokemon = value),
                      validator: (value) =>
                          value == null ? 'Select a starter Pokémon' : null,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _formKey.currentState!.validate()
                          ? () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("AlertDialog"),
                                    content: Text(
                                        "Are you sure you want to submit?"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('CANCEL')),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Application submitted successfully!')));
                                          },
                                          child: Text('YES'))
                                    ],
                                  );
                                },
                              );
                            }
                          : null,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
