import 'package:flutter/material.dart';
import 'package:flutter_web_api_v1/helpers/weekday.dart';
import 'package:flutter_web_api_v1/models/journal.dart';
import 'package:flutter_web_api_v1/services/journal_service.dart';

class AddJournalScreen extends StatelessWidget {
  AddJournalScreen({
    super.key,
    required this.journal,
  });

  final Journal journal;
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${WeekDay(journal.createdAt.weekday).long.toLowerCase()}, ${journal.createdAt.day} | ${journal.createdAt.month} | ${journal.createdAt.year}"),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  void registerJournal(BuildContext context) async {
    String content = _contentController.text;
    journal.content = content;
    JournalService service = JournalService();
    bool result = await service.register(journal);
    Navigator.pop(context, result);
  }
}
