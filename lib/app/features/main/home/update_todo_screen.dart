import 'package:flutter/material.dart';
import 'package:flutter_application_example/app/features/main/home/todo_detail_screen.dart';
import 'package:flutter_application_example/app/widgets/gap.dart';
import 'package:flutter_application_example/app/widgets/status/button_loading.dart';
import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:flutter_application_example/data/api/todo/todo_update.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_hook_extensions/riverpod_hook_extensions.dart';
import 'package:riverpod_hook_mutation/riverpod_hook_mutation.dart';

class UpdateTodoScreen extends HookConsumerWidget {
  const UpdateTodoScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = todoProvider(id);
    final state = ref.watch(provider);

    final formKey = useFormKey();
    final mutation = useMutation<TodoResponse>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo'),
      ),
      body: state.when(
        data: (data) {
          final title = useTextEditingController(text: data.title);
          final isSelected = useState(data.completed);

          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleFormField(
                    controller: title,
                  ),
                  const Gap(16),
                  CheckboxListTile(
                    title: Text(
                      isSelected.value ? 'Completed' : 'Not Completed',
                    ),
                    value: isSelected.value,
                    onChanged: isSelected.maybeUpdate,
                  ),
                  const Gap(16),
                  FilledButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;

                        final todo = TodoUpdate(
                          title: title.text,
                          completed: isSelected.value,
                        );

                        final notifier = ref.read(provider.notifier);
                        mutation.future(
                          notifier.updateTodo(todo),
                          data: (data) {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Todo updated'),
                              ),
                            );
                          },
                          error: (error, stackTrace) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error.toString()),
                              ),
                            );
                          },
                        );
                      },
                      child: mutation.isLoading
                          ? const ButtonLoading()
                          : const Text('Update')),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class TitleFormField extends StatelessWidget {
  const TitleFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Title',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
    );
  }
}
