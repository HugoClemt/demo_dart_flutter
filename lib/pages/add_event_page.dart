import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedType = 'talk';
  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    hintText: "Entrez votre nom",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer un nom";
                    }
                    return null;
                  },
                  controller: confNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Speaker',
                    hintText: "Entrez le speaker",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer un speaker";
                    }
                    return null;
                  },
                  controller: speakerNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                        value: 'talk',
                        child: Text(
                          'Talk shox',
                        )),
                    DropdownMenuItem(
                        value: 'demo',
                        child: Text(
                          'Demo code',
                        )),
                    DropdownMenuItem(
                        value: 'partner',
                        child: Text(
                          'Partner',
                        )),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Type',
                    hintText: "Entrez le type",
                    border: OutlineInputBorder(),
                  ),
                  value: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Date',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (DateTime? e) {
                    return (e?.day ?? 0) == 1
                        ? 'Please not the first day'
                        : null;
                  },
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final confName = confNameController.text;
                      final speakerName = speakerNameController.text;

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Ajouté !'),
                      ));
                      FocusScope.of(context).requestFocus(FocusNode());

                      CollectionReference eventsRef =
                          FirebaseFirestore.instance.collection('Events');
                      eventsRef.add({
                        'speaker': speakerName,
                        'date': selectedDate,
                        'title': confName,
                        'type': selectedType,
                        'avatar': 'lior',
                      });

                      /* print("Ajout de la conf $confName par $speakerName");
                      print("Type : $selectedType");
                      print("Date : $selectedDate"); */
                    }
                  },
                  child: const Text('Ajouter'),
                ),
              ),
            ],
          )),
    );
  }
}
