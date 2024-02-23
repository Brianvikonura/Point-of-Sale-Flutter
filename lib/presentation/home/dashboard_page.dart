import 'package:flutter/material.dart';
import 'package:point_of_sale_flutter/data/datasources/auth_local_datasource.dart';
import 'package:point_of_sale_flutter/data/models/response/auth_response_model.dart';
import 'package:point_of_sale_flutter/presentation/auth/login_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  User? user;

  @override
  void initState() {
    AuthLocalDatasource().getAuthData().then((value) {
      if (value != null) {
        setState(() {
          user = value.user;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to Dashboard'),
            Text('Name: ${user?.name ?? ''}'),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                AuthLocalDatasource().removeAuthData().then((value) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }), (route) => false);
                });
              },
              child: const Text('logout'),
            )
          ],
        ),
      ),
    );
  }
}
