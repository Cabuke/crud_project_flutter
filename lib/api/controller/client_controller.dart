import 'package:flutter_app/components/storage_token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/clients_model.dart';

class ClientController {
  //  Por causa do uso de emuladores e/ou dispositivos moveis pessoais,
  //  o localhost não funciona como porta de acesso a API, assim sendo necessario o uso da porta do IPV04

  final baseUrl = Uri.parse("http://192.168.15.203:3000");

  // METHOD GET

  Future<List<ClientsModel>> fetchClients() async {
    final url = Uri.parse('$baseUrl/clients/all');
    final token = await TokenService.getToken();
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> clientsJson = jsonDecode(response.body);

      return clientsJson.map((json) => ClientsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get Clients');
    }
  }

  // create POST!!

  static Future<bool> createClient(
    String name,
    String email,
    String tag,
  ) async {
    final url = Uri.parse("http://192.168.15.203:3000/clients/create");
    final token = await TokenService.getToken();
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final body = jsonEncode({
      "name": name,
      "email": email,
      "tags": tag,
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

  // METHOD PUT

  Future<Map<String, dynamic>> updateClient(
    String id,
    String name,
    String email,
    String tag,
  ) async {
    final urlUpdate = Uri.parse('$baseUrl/client/$id');
    final token = await TokenService.getToken();
    Map<String, String> newClientData = {
      'name': name,
      'email': email,
      'tag': tag,
    };
    String jsonData = jsonEncode(newClientData);

    final response = await http.put(
      urlUpdate,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonData,
    );
    if (response.statusCode == 200) {
      final updated = jsonDecode(response.body);
      return updated;
    } else {
      throw Exception('Failed to delete Client');
    }
  }

// METHOD DELETE

  Future<Map<String, dynamic>> deleteClient(String id) async {
    final urlDel = Uri.parse('$baseUrl/client/$id');
    final token = await TokenService.getToken();
    final response = await http.delete(
      urlDel,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      final deleted = jsonDecode(response.body);
      return deleted;
    } else {
      throw Exception('Failed to delete Client');
    }
  }
}
