import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  static const routeName = '/OnboardingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "INDICIUM",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Colors.pink),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 54,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: () {
                  buildArtist();
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                child: Text(
                  "Create an Artist",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void buildArtist() async {
  final artistFields = <String, SchemaKind>{
    'name': SchemaKind.STRING,
    'did': SchemaKind.STRING,
    'profile_pic': SchemaKind.STRING,
    'bio': SchemaKind.STRING,
    'collectible': SchemaKind.LINK,
    'quantity': SchemaKind.INT,
  };

  final responseArtist =
      await MotorFlutter.to.publishSchema("artist", artistFields);
  final artistSchema = responseArtist.schemaDefinition;

  final exampleArtist = artistSchema.newDocument();
  exampleArtist.set<String>("name", "ASAP Rocky");
  exampleArtist.set<String>("did", MotorFlutter.to.address.value);
  exampleArtist.set<String>("profile_pic",
      "https://avatars.dicebear.com/api/adventurer/your-custom-seed.svg"); // Get image using whatever

  exampleArtist.upload("indicium-artist");
}
