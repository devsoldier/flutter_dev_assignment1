import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

class UserProvider with ChangeNotifier {
  List<UserDetails> userdetails = [];
  List<PaginationDetails> bookdetails = [];
  List<ResourceDetails> resourcedetails = [];
  bool isAuthenticated = false;
  String? token;
  String? error;

  Future<void> getusers(int page) async {
    userdetails.clear();
    bookdetails.clear();
    final url = Uri.parse('https://reqres.in/api/users?page=${page}');
    final response = await http.get(url);
    final responsedata = json.decode(response.body);

    bookdetails.add(PaginationDetails(
        page: responsedata["page"],
        per_page: responsedata["per_page"],
        total: responsedata["total"],
        total_pages: responsedata["total_pages"]));
    print('page:${bookdetails[0].page}');
    print('per_page:${bookdetails[0].per_page}');
    print('total:${bookdetails[0].total}');
    print('total pages:${bookdetails[0].total_pages}');

    for (int i = 0; i < responsedata["data"].length; i++) {
      userdetails.add(
        UserDetails(
          id: responsedata["data"][i]["id"],
          email: responsedata["data"][i]["email"],
          fname: responsedata["data"][i]["first_name"],
          lname: responsedata["data"][i]["last_name"],
          avatar: responsedata["data"][i]["avatar"],
        ),
      );
    }
    print(userdetails.length);
    print(userdetails);

    notifyListeners();
  }

  Future<void> getresource() async {
    userdetails.clear();
    bookdetails.clear();
    final url = Uri.parse('https://reqres.in/api/unknown}');
    final response = await http.get(url);
    final responsedata = json.decode(response.body);

    bookdetails.add(PaginationDetails(
        page: responsedata["page"],
        per_page: responsedata["per_page"],
        total: responsedata["total"],
        total_pages: responsedata["total_pages"]));
    print('page:${bookdetails[0].page}');
    print('per_page:${bookdetails[0].per_page}');
    print('total:${bookdetails[0].total}');
    print('total pages:${bookdetails[0].total_pages}');

    for (int i = 0; i < responsedata["data"].length; i++) {
      resourcedetails.add(
        ResourceDetails(
          id: responsedata["data"][i]["id"],
          name: responsedata["data"][i]["name"],
          year: responsedata["data"][i]["year"],
          color: responsedata["data"][i]["color"],
          pantone: responsedata["data"][i]["pantone_value"],
        ),
      );
    }
    print(resourcedetails.length);
    print(resourcedetails);

    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    final url = Uri.parse('https://reqres.in/api/register');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {"email": email, "password": password},
      ),
    );
    final responsedata = json.decode(response.body);
    token = responsedata["token"];
    error = responsedata["error"];
    if (token!.isNotEmpty) {
      isAuthenticated = true;
    } else if (token!.isEmpty) {
      isAuthenticated = false;
    }

    print('TOKEN: ${token}');
    print('authentication: $isAuthenticated');
    print('ERROR: $error');
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
    print('pref value: $prefs');
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse('https://reqres.in/api/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {"email": email, "password": password},
      ),
    );
    final responsedata = json.decode(response.body);
    token = responsedata["token"];
    error = responsedata["error"];
    if (token!.isNotEmpty) {
      isAuthenticated = true;
    } else if (token!.isEmpty) {
      isAuthenticated = false;
    }
    print('TOKEN: ${token}');
    print('authentication: $isAuthenticated');
    print('ERROR: $error');
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
    print('pref value: $prefs');
  }

  Future<void> logout() async {
    isAuthenticated = false;
    print('authentication: $isAuthenticated');
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }
}
