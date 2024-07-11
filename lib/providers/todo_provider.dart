import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../api/firebase_todo_api.dart';
import '../models/todo_model.dart';

class TodoListProvider with ChangeNotifier {
  late Stream<QuerySnapshot> _todosStream;
  var firebaseService = FirebaseTodoAPI();

  TodoListProvider() {
    fetchTodos();
  }

  // getter
  Stream<QuerySnapshot> get todo => _todosStream;

  // TODO: get all todo items from Firestore
  void fetchTodos() {
    _todosStream = firebaseService.getAllTodos();
    notifyListeners();
  }

  // TODO: add todo item and store it in Firestore
  void addTodo(Todo item) async {
    await firebaseService.addTodo(item.toJson(item));
    notifyListeners();
  }

  // TODO: edit a todo item and update it in Firestore
  void editTodo(Todo item, String newTitle) async {
    await firebaseService.editTodo(item.id!, newTitle);
    notifyListeners();
  }

  // TODO: delete a todo item and update it in Firestore
  void deleteTodo(Todo item) async {
    await firebaseService.deleteTodo(item.id!);
    notifyListeners();
  }

  // TODO: modify a todo status and update it in Firestore
  void toggleStatus(Todo item, bool status) async {
    await firebaseService.toggleStatus(item.id!, status);
    notifyListeners();
  }
}
