import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
// Função para salvar o token localmente
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // LOGIN
  static Future<Object?> fazerLogin(
    String email,
    String password,
  ) async {
    final url = Uri.parse("http://192.168.15.203:3000/auth/login");

    // Primeiro, valida o email e a senha
    final isValid = await validarCredenciais(email, password);
    if (!isValid) {
      return false;
    }
    // Se as credenciais forem válidas, faz a chamada para obter o token
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({"email": email, "password": password});
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final String? token = responseData['token'];
        if (token != null) {
          await saveToken(token);
          return token;
        }
      }

      return response;
    } catch (err) {
      Exception("Desculpe houve um erro: $err");
    }

    return false;
  }

  // create CLIENT!!

  static Future<bool> createUser(
    String name,
    String email,
    String password,
  ) async {
    final url = Uri.parse("http://192.168.15.203:3000/auth/register");
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
      "confirmpassword": password,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      print('SUCESSO!!!!');
      return true;
    } else {
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['error'];
      print(errorMessage);

      return false;
    }
  }

  // GET VALID USERS //

  static Future<bool> validarCredenciais(String email, String password) async {
    final url = Uri.parse("http://192.168.15.203:3000/auth/users/all");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);
        // Verifica se há algum usuário com o email e a senha fornecidos
        for (var user in users) {
          if (user['email'] == email && user['password'] == password) {
            return true;
          }
        }
      }
      return false;
    } catch (err) {
      Exception('Error: $err,');
      print("Erro ao validar credenciais: $err");
      return false;
    }
  }
}
