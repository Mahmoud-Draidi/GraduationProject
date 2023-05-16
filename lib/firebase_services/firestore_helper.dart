import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  static final FirestoreHelper _instance = FirestoreHelper._internal();

  factory FirestoreHelper() {
    return _instance;
  }

  FirestoreHelper._internal();

  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFirestore(Map<String, dynamic> map) async {
    await _usersCollection.add(map);
  }

  Future<List<Map<String, dynamic>>> getAllUsersFromFirestore() async {
    final QuerySnapshot snapshot = await _usersCollection.get();
    final List<QueryDocumentSnapshot> documents = snapshot.docs;
    return documents.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}


// Map<String, dynamic> userData = {
//   'name': 'omar ',
//   'email': 'omar@example.com',
// };
//
// FirestoreHelper firestoreHelper = FirestoreHelper();
//
// firestoreHelper.addUserToFirestore(userData).then((_) {
//   print('User added to Firestore successfully');
// }).catchError((error) {
//   print('Error adding user to Firestore: $error');
// });


// FirestoreHelper firestoreHelper = FirestoreHelper();
//
// firestoreHelper.getAllUsersFromFirestore().then((users) {
//   // Process the retrieved users
//   for (Map<String, dynamic> user in users) {
//     String name = user['name'];
//     String email = user['email'];
//     // Additional processing
//     print('Name: $name, Email: $email');
//   }
// }).catchError((error) {
//   print('Error retrieving users from Firestore: $error');
// });