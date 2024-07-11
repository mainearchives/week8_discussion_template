import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoAPI {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllTodos() {
    return db.collection("todos").snapshots();
  }

  Future<String> addTodo(Map<String, dynamic> todo) async {
    try {
      await db.collection("todos").add(todo);
      return "Successfully added todo!";
    } on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<String> deleteTodo(String id) async {
    try {
      await db.collection("todos").doc(id).delete();

      return "Successfully deleted todo!";
    } on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<String> editTodo(String id, String newTitle) async {
    try {
      await db.collection("todos").doc(id).update({"title": newTitle});
      return "Successfully edited todo!";
    } on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<String> toggleStatus(String id, bool newStatus) async {
    try {
      await db.collection("todos").doc(id).update({"completed": newStatus});
      return "Successfully edited todo!";
    } on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }
}
