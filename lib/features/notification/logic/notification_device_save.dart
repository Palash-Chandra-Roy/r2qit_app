import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

void notificationDeviceToken({token, required String fid}) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String id = prefs.getString("id").toString();
  await db.collection("deviceToken").doc(id).set({
    'device_token': token,
    "fid_token": fid,
    'updated_at': FieldValue.serverTimestamp(), // সময় সহ
  });
}
