import 'package:firebase_app_installations/firebase_app_installations.dart';

Future<String> FID() async {
  final fid = await FirebaseInstallations.instance.getId();
  return fid;
}
