import 'package:agrak_flutter_challenge/application/users_service.dart';
import 'package:agrak_flutter_challenge/config/user_form_provider.dart';
import 'package:agrak_flutter_challenge/domain/create_user_model.dart';
import 'package:agrak_flutter_challenge/presentation/utilities/form_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UserForm extends ConsumerWidget {
  const UserForm({required this.userId, super.key});
  final String? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formdata = ref.watch(userFormProvider(userId));

    onSubmit() async {
      final data = formdata.value;
      
      if (userId != null) {
        await ref
            .read(userServiceProvider)
            .update(userId!, CreateUser.fromMap(data!.value));
      } else {
        await ref
            .read(userServiceProvider)
            .create(CreateUser.fromMap(data!.value));
      }
      return Navigator.of(context).pop(); //validar el nombre de la ruta
    }

    onCancel() {
      return Navigator.of(context).pop();
    }

    return formdata.when(
      error: (error, stack) {
        
        return Text('Error: $error');
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReactiveForm(
                formGroup: data,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReactiveTextField(
                        formControlName: 'first_name',
                        decoration: InputDecorations.inputsDecoration(
                            labelText: 'First Name', hintText: 'Pedro')),
                    const SizedBox(height: 20),
                    ReactiveTextField(
                      formControlName: 'second_name',
                      decoration: InputDecorations.inputsDecoration(
                          labelText: 'Second Name', hintText: 'Pérez'),
                    ),
                    const SizedBox(height: 20),
                    ReactiveTextField(
                      formControlName: 'email',
                      decoration: InputDecorations.inputsDecoration(
                          labelText: 'Email', hintText: 'abc@mail.com'),
                    ),
                    const SizedBox(height: 20),
                    ReactiveTextField(
                      formControlName: 'avatar',
                      decoration: InputDecorations.inputsDecoration(
                          labelText: 'Avatar',
                          hintText: 'https://www.example.com/avatar.png'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SaveButtom(onpressed: ()=> onSubmit()),
                        const SizedBox(width: 5,),
                        CancelButtom(
                      onPressed: () {
                        onCancel();
                      },
                    )
                      ]
                    )
                    
                  ],
                ))
          ],
        );
      },
    );
  }
}

class SaveButtom extends StatelessWidget {
  const SaveButtom({super.key, required this.onpressed});
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onpressed(),
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 79, 151, 82),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: const Text(
          'Guardar',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}

class CancelButtom extends StatelessWidget {
  const CancelButtom({super.key, required this.onPressed});
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 54, 89, 213),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: const Text(
          'Cancelar',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}
