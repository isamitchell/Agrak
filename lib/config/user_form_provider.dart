import 'package:agrak_flutter_challenge/application/users_service.dart';
import 'package:agrak_flutter_challenge/domain/user_model.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_form_provider.g.dart';

FormGroup _userFormController(User? user) {
  return FormGroup({
    'first_name': FormControl<String>(
        value: user?.firstName, validators: [Validators.required]),
    'second_name': FormControl<String>(
        value: user?.secondName, validators: [Validators.required]),
    'email': FormControl<String>(
        value: user?.email,
        validators: [Validators.required, Validators.email]),
    'avatar': FormControl<String>(
        value: user?.avatar, validators: [Validators.required]),
  });
}

@riverpod
Future<FormGroup> userForm(UserFormRef ref, String? userId) async {
  final userService = ref.read(userServiceProvider);
  final User? user = userId != null ? await userService.getUSer(userId) : null;
  return _userFormController(user);
}
