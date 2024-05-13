
// // ignore_for_file: empty_constructor_bodies

// import 'package:bloc/bloc.dart';
// import 'package:bloc_example/bloc/list_bloc/todo_list_event.dart';
// import 'package:bloc_example/bloc/list_bloc/todo_list_state.dart';

// class TodoBloc extends Bloc<TodoEvents, TodoState>{

//   final List<String> todolist = [];
//   TodoBloc(): super(const TodoState()){
//   on<AddDataEvent>(_addTodo);
//   on<DeleteDataEvent>(_deleteTodo);
//   }
//   void _addTodo(AddDataEvent event , Emitter<TodoState> emit){
//     todolist.add(event.task);
//     emit(state.copyWith(todolist: List.from(todolist)));
//   }
//   void _deleteTodo(DeleteDataEvent event, Emitter<TodoState>emit){
//     // final task  = todolist.firstWhere((element) => element == event.task);
//     todolist.remove(event.task);
//     emit(state.copyWith(todolist: List.from(todolist)));
   
//   }
  
// }