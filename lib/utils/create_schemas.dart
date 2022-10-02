
import 'package:motor_flutter/motor_flutter.dart';

Future<SchemaDefinition?> broadcastInitialArtistSchemaDefinition() async{
    final artistFields = <String, SchemaKind>{
    'name': SchemaKind.STRING,
    'did': SchemaKind.STRING,
    'profile_pic': SchemaKind.STRING,
    'bio': SchemaKind.STRING,
    'collectible': SchemaKind.LINK,
    'quantity': SchemaKind.STRING,
  };

  final responseArtist =
      await MotorFlutter.to.publishSchema("artist", artistFields);
return responseArtist.schemaDefinition;
}

Future<SchemaDefinition?> broadcastInitialCollectibleSchemaDefinition() async{
       final collectibles = <String, SchemaKind>{
    'quantity': SchemaKind.STRING,
    'name': SchemaKind.STRING,
    'price': SchemaKind.INT,
    'asset': SchemaKind.STRING,
  };

  final responseCollectible =
      await MotorFlutter.to.publishSchema("collectible", collectibles);
  return responseCollectible.schemaDefinition;
}

