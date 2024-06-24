
import 'package:isar/isar.dart';

part 'todo_item.g.dart';

@collection
class TodoItem {
  TodoItem({required this.description, required this.checked, required this.order});

  Id id = Isar.autoIncrement;
  String description;
  bool checked;

  @Index(type: IndexType.value)
  int order;
}
