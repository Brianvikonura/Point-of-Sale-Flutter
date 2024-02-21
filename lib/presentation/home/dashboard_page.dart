import 'package:flutter/material.dart';
import 'package:point_of_sale_flutter/data/datasources/auth_local_datasource.dart';
import 'package:point_of_sale_flutter/data/models/response/auth_response_model.dart';

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
      setState(() {
        user = value.user;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Center(
        child: Column(
          children: [
            const Text('Welcome to Dashboard'),
            Text('Name: ${user?.name ?? ''}'),
          ],
        ),
      ),
    );
  }
}
