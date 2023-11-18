import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final events = [];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Events')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Text('Aucune donnée'),
          );
        }

        List<dynamic> events = [];
        snapshot.data!.docs.forEach((element) {
          events.add(element.data());
        });

        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            final avatar = event['avatar'];
            final speaker = event['speaker'];
            final Timestamp timestamp = event['date'];
            final date = DateFormat.yMd().add_jm().format(timestamp.toDate());
            final title = event['title'];

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/$avatar.jpg'),
                ),
                title: Text('$speaker, ($date)'),
                subtitle: Text('$title'),
                trailing: const Icon(Icons.messenger),
              ),
            );
          },
        );
      },
    ));
  }
}
