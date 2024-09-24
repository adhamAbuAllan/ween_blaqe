import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
main(){
runApp(const CancelRequestApiTest());
test("description", (){
  const CancelRequestApiTest();
});
}
class CancelRequestApiTest extends StatefulWidget {
  const CancelRequestApiTest({super.key});

  @override
  State<CancelRequestApiTest> createState() => _CancelRequestApiTestState();
}

class _CancelRequestApiTestState extends State<CancelRequestApiTest> {
  ApiServiceTest apiServiceTest = ApiServiceTest();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                    onPressed: () async {
      
                    },
                    child: const Text("request"),
                  ) ,
              ElevatedButton(
                    onPressed: () async {apiServiceTest.fetchData("www"
                        ".example.com");},
                    child: const Text("cansel request"),
                  ),
            ],
          )),
    );
  }
}

class ApiServiceTest {
  Future<http.Response> fetchData(String url) async {
    final client = http.Client();
    try {
      final response = await client.get(Uri.parse(url)).timeout(
        const Duration(seconds: 10), // Set a timeout duration
        onTimeout: () {
          client.close();
          throw TimeoutException('Request timed out');
        },
      );
      return response;
    } finally {
      client.close(); // Always close the client to prevent memory leaks
    }
  }
}
