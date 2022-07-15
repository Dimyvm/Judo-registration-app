import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heightMinAppbar = (MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registreer Uw aanwezigheid'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child:
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: ListTile(
                  //     leading: CircleAvatar(
                  //       radius: 30,
                  //       backgroundColor: Colors.purple[100],
                  //       child: const Icon(
                  //         Icons.person,
                  //         size: 32,
                  //       ),
                  //     ),
                  //     title: const Text(
                  //       'Dimitry Van Mulders',
                  //       style: TextStyle(fontSize: 24),
                  //     ),
                  //     trailing: const Icon(Icons.start_outlined),
                  //   ),
                  // ),

                  Container(
                width: double.infinity,
                height: (heightMinAppbar / 7) - 20,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purple[100],
                      child: const Icon(
                        Icons.person,
                        size: 32,
                      ),
                    ),
                    const Text(
                      'Dimitry Van Mulders',
                      style: TextStyle(fontSize: 24),
                    ),
                    const Icon(Icons.start_outlined),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
