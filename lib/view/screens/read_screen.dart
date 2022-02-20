import 'package:flutter/material.dart';
import 'package:poetry_app/utils/extensions.dart';
import 'package:poetry_app/utils/sizing.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/annie-spratt-wuc-KEIBrdE-unsplash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            YGap(context.screenHeight(.2)),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth(.4)),
              child: const Text(
                'Not at Home to CallersNot at Home to CallersNot',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const YGap(10),
            const Text(
              'wolf whiteman',
              style: TextStyle(color: Colors.white),
            ),
            const YGap(100),
            const Text(
                "Summer begins to have the look"
                "Peruser of enchanting Book"
                "Reluctantly but sure perceives"
                "A gain upon the backward leaves --"
                ""
                "Autumn begins to be inferred"
                "By millinery of the cloud"
                "Or deeper color in the shawl"
                "That wraps the everlasting hill."
                ""
                "The eye begins its avarice"
                "A meditation chastens speech"
                "Some Dyer of a distant tree"
                "Resumes his gaudy industry."
                ""
                "Conclusion is the course of All"
                "At most to be perennial"
                "And then elude stability"
                "Recalls to immortality.",
                style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
      ),
    );
  }
}