import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextWrapper extends StatefulWidget {
  const TextWrapper({super.key,required this.text});
  final String text;
  @override
  State<TextWrapper> createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper> {
  bool isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: ConstrainedBox(
            constraints: isExpanded
                ? const BoxConstraints()
                : const BoxConstraints(maxHeight: 70),
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        isExpanded
            ? TextButton.icon(
                icon: const Icon(Icons.arrow_upward),
                label: const Text('Read less'),
                onPressed: () => setState(() => isExpanded = false),
              )
            : TextButton.icon(
                icon: const Icon(Icons.arrow_downward),
                label: const Text('Read more'),
                onPressed: () => setState(() => isExpanded = true),
              ),
      ],
    );
  }
}