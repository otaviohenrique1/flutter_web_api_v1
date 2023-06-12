import 'package:flutter/material.dart';
import 'package:flutter_web_api_v1/helpers/weekday.dart';
import 'package:flutter_web_api_v1/models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  const AddJournalScreen({
    super.key,
    required this.journal,
  });

  final Journal journal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${WeekDay(journal.createdAt.weekday).long.toLowerCase()}, ${journal.createdAt.day} | ${journal.createdAt.month} | ${journal.createdAt.year}"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }
}
