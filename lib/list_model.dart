import './task.dart';
import './task_row.dart';
import 'package:flutter/material.dart';

class ListModel {
  ListModel(this.listKey, items) : this.items = new List.of(items);

  final GlobalKey<AnimatedListState> listKey;
  final List<Task> items;

  AnimatedListState get _animatedList => listKey.currentState;

  // insert
  void insert(int index, Task item) {
    items.insert(index, item);
    _animatedList.insertItem(index, duration: Duration(milliseconds: 150));
  }

  // remove
  Task removeAt(int index) {
    final Task removeItem = items.removeAt(index);
    if (removeItem != null) {
      _animatedList.removeItem(
          index,
          (context, animation) => new TaskRow(
                task: removeItem,
                animation: animation,
              ),
          duration:
              Duration(milliseconds: (150 + 150 * (index / length)).toInt()));
    }
    return removeItem;
  }

  int get length => items.length;

  Task operator [](int index) => items[index];

  int indexOf(Task item) => items.indexOf(item);
}
