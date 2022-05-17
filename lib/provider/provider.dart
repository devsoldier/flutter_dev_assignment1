import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/screen/user_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

class UserProvider with ChangeNotifier {
  PaginationDetails<UserDetails>? userdetails;
  PaginationDetails<ResourceDetails>? resourcedetails;
  bool isAuthenticated = false;
  String? token;
  String? error;
  // PaginationDetails<UserDetails> data;

  Future<void> getusers(int page) async {
    final url = Uri.parse('https://reqres.in/api/users?page=${page}');
    final response = await http.get(url);
    final responsedata = json.decode(response.body);
    // userdetails = PaginationDetails<UserDetails>(
    //   page: responsedata["page"],
    //   per_page: responsedata["per_page"],
    //   total: responsedata["total"],
    //   total_pages: responsedata["total_pages"],
    //   data: (responsedata["data"] as List)
    //       .map((e) => UserDetails(
    //           id: e["id"],
    //           email: e["email"],
    //           fname: e["first_name"],
    //           lname: e["last_name"],
    //           avatar: e["avatar"]))
    //       .toList(),
    // );
    userdetails = PaginationDetails<UserDetails>.fromJson(
      responsedata,
      (json) => UserDetails.fromJson(json as Map<String, dynamic>),
    );
    print(userdetails?.perPage); //prints 6
    print(userdetails?.data); //prints the list
    print(userdetails?.data[1].firstName); //prints janet
    notifyListeners();
  }

  Future<void> getresource() async {
    final url = Uri.parse('https://reqres.in/api/unknown}');
    final response = await http.get(url);
    final responsedata = json.decode(response.body);
    final resourcedetails = PaginationDetails<ResourceDetails>(
      page: responsedata["page"],
      perPage: responsedata["per_page"],
      total: responsedata["total"],
      totalPages: responsedata["total_pages"],
      data: (responsedata["data"] as List)
          .map((e) => ResourceDetails(
              id: e["id"],
              name: e["name"],
              year: e["year"],
              color: e["color"],
              pantone: e["pantone_value"]))
          .toList(),
    );
    print(resourcedetails.data);
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
