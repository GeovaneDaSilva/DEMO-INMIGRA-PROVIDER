import 'dart:async';

class SupportBloc {
  final _nameController = StreamController<String>.broadcast();
  final _emailController = StreamController<String>.broadcast();
  final _titleController = StreamController<String>.broadcast();
  final _descriptionController = StreamController<String>.broadcast();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get titleStream => _titleController.stream;
  Stream<String> get descriptionStream => _descriptionController.stream;

  void dispose() {
    _nameController.close();
    _emailController.close();
    _titleController.close();
    _descriptionController.close();
  }
}
