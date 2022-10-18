import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool forPremiumOnly = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Post to community',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: IconButton(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ),
          Expanded(
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add),
                      SizedBox(height: 50),
                      Text('Click here to upload your image.')
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (str) {},
              maxLines: null,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.black12, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: false,
                hintText: 'Enter your description here.',
              ),
            ),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: forPremiumOnly,
                  onChanged: (bool value) =>
                      setState(() => forPremiumOnly = value),
                ),
                Text(
                  'For premium user only',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            trailing: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Submit'),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
