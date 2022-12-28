// ignore_for_file: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vonette_web/models/user.dart';

// check the auth.dart when the person first registers, then the DataService is
// called to create a database for the user with the user.uid
class DatabaseService {
  final UserInApp? user;
  DatabaseService({this.user});

  final CollectionReference<Map<String, dynamic>> _userInfo =
      FirebaseFirestore.instance.collection('SuperUserInformation');

  Future firstTimeCreateDM(String? profile_url) async {
    return await _userInfo.doc(user?.uid).set({
      'username': user?.username,
      'email': user?.email,
      'uid': user?.uid,
      'profile_url': profile_url,
      'successful': false,
    });
  }

  Future get getUIDList {
    return _userInfo.get().then((value) {
      if (value.size == 0) {
        return null;
      } else {
        var docs = value.docs.map((e) => e.data()['uid']);
        return docs.toList();
      }
    });
  }

  Stream<QuerySnapshot> get updateUserStream {
    return _userInfo.snapshots();
  }
}
