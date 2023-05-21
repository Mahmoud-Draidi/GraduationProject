import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelperBooks {
  static final FirestoreHelperBooks _instance = FirestoreHelperBooks._internal();

  factory FirestoreHelperBooks() {
    return _instance;
  }

  FirestoreHelperBooks._internal();

  final CollectionReference _driverCollection =
  FirebaseFirestore.instance.collection('bookHistory');
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addBookToFirestore(Map<String, dynamic> map) async {
    await _driverCollection.add(map);
  }

  Future<List<Map<String, dynamic>>> getAllUsersFromFirestore() async {
    final QuerySnapshot snapshot = await _driverCollection.get();
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