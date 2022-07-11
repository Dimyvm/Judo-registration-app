import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registreer Uw aanwezigheid'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple[100],
                  child: const Icon(Icons.person),
                ),
                title: const Text('Dimitry Van Mulders'),
                trailing: const Icon(Icons.start_outlined),
              ),
            );
          },
        ),
      ),
    );
  }
}
