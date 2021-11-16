import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String text;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0 * 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imagePath,
              width: 450,
              height: 250,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(width: 8.0 * 3),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    widget.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 8.0 * 3),
                  SelectableText(
                    widget.text,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
