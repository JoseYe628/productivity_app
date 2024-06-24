
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:productivity_app/database/todo_item/todo_item.dart';

class TodoItemDatabase extends ChangeNotifier {
  static late Isar isar;
  final List<TodoItem> currentTodoItems = [];

  // Inicilizar base de datos
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [TodoItemSchema],
      directory: dir.path
    );
  }

  // Crear
  Future<void> addTodoItem(String description, bool checked) async {
    //obtener el último item para obtener su order
    final lastItem = await isar.todoItems.where().sortByOrderDesc().findFirst();
    final newOrder = (lastItem?.order ?? -1) + 1;

    // crear el todo item
    TodoItem todoItem = TodoItem(
      order: newOrder,
      description: description,
      checked: checked
    );

    // almacenar el todo item
    await isar.writeTxn(() => isar.todoItems.put(todoItem));

    // volver a leer los items
    await fetchTodoItems();
  }

  // Leer todo items
  Future<void> fetchTodoItems() async {
    final fetchedItems = await isar.todoItems.where().findAll();
    currentTodoItems.clear();
    currentTodoItems.addAll(fetchedItems);
    notifyListeners();
  }

  // Actualizar todo item
  Future<void> updateTodoItem(int id, String description, bool checked) async {
    final existingTodoItem = await isar.todoItems.get(id);
    if (existingTodoItem != null) {
      existingTodoItem.description = description;
      existingTodoItem.checked = checked;
      await isar.writeTxn(() => isar.todoItems.put(existingTodoItem));
      await fetchTodoItems();
    }
  }

  // Eliminar todo item
  Future<void> deleteTodoItem(int id) async {
    await isar.writeTxn(() => isar.todoItems.delete(id));
    await fetchTodoItems();
  }
}
