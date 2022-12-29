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

  final CollectionReference<Map<String, dynamic>> _studentInfo =
      FirebaseFirestore.instance.collection('UserInformation');

  Future get getInformation async {
    Map userChatsMap = {};
    await _studentInfo.get().then((querySnapshot) async {
      var userUIDS = querySnapshot.docs.map((e) => e.id).toList();
      var userInfo = querySnapshot.docs.map((e) => e.data()).toList();

      for (int i = 0; i < userUIDS.length; i++) {
        await _studentInfo
            .doc(userUIDS[i])
            .collection("Messages")
            .get()
            .then((querySnapshot2) async {
          var userGroupIDS = querySnapshot2.docs.map((e) => e.id).toList();

          Map chatNameMessagesMap = {};
          for (int j = 0; j < userGroupIDS.length; j++) {
            List chats = await _studentInfo
                .doc(userUIDS[i])
                .collection("Messages")
                .doc(userGroupIDS[j])
                .collection("Chats")
                .get()
                .then((querySnapshot3) {
              return querySnapshot3.docs.map((e) => e.data()).toList();
            });
            chatNameMessagesMap[userGroupIDS[j]] = chats;
          }
          userChatsMap[[userUIDS[i], userInfo[i]]] = chatNameMessagesMap;
        });
      }
    });
    print(userChatsMap.keys.first);
    print(userChatsMap.values.first);
  }
}
