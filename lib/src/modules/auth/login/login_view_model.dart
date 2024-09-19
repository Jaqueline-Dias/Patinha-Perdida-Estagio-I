import 'package:app_patinha/src/core/helpears/messages.dart';
import 'package:app_patinha/src/repositories/user/user_login_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginViewModel with MessageStateMixin {
  final UserLoginRepository _userLoginRepository;

  LoginViewModel({
    required UserLoginRepository userLoginRepository,
  }) : _userLoginRepository = userLoginRepository;

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get logged => _logged();
  bool get obscurePassword => _obscurePassword();

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    try {
      final String? loginResult =
          await _userLoginRepository.execute(email, password);

      // Verifique se o resultado do login não é nulo
      if (loginResult != null) {
        _logged.value = true;
      } else {
        // Trate o caso em que o resultado do login é nulo (por exemplo, credenciais inválidas)
        showError('Credenciais inválidas');
      }
    } catch (e) {
      // Trate o caso de exceção ao realizar login
      showError('Erro ao realizar login: $e');
    }
  }
}
