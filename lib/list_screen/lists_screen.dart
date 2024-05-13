

// import 'package:bloc_example/bloc/list_bloc/todo_list_bloc.dart';
// import 'package:bloc_example/bloc/list_bloc/todo_list_event.dart';
// import 'package:bloc_example/bloc/list_bloc/todo_list_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ToDoListScreen extends StatefulWidget {
//   const ToDoListScreen({super.key});

//   @override
//   State<ToDoListScreen> createState() => _ToDoListScreenState();
// }

// class _ToDoListScreenState extends State<ToDoListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // ignore: avoid_print
//     print('build');
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue,
//         title: const Text('Todo List'),),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         // for(int i = 0 ; i < 10; i++){

//         // }
//         context.read<TodoBloc>().add((AddDataEvent( ' Inzamam')));
//         // Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTodoScreen()));
//       }, child: const Icon(Icons.add),),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
//           if ((state.todolist.isEmpty)) {
//             return const Text('Todo List is Empty');
//           } else {
//             return ListView.builder(itemCount: state.todolist.length, itemBuilder: (context, index) {
//               return ListTile(title: Text(state.todolist[index].toString()),
//               trailing: IconButton(onPressed: () {
//                 context.read<TodoBloc>().add((DeleteDataEvent(state.todolist[index])));
//               }, icon: const Icon(Icons.delete)));
             

//             },);
//           }
//         },),
//       ),
//     );
//   }
// }