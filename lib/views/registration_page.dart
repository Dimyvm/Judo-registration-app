import 'package:flutter/material.dart';

import '../widgets/person_tile.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final double heightMinAppbar = (MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registreer uw aanwezigheid'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return 
            PersonTile(heightMinAppbar: heightMinAppbar, name: 'Dimitry Van Mulders', isRegistered: false,);
          },
        ),
      ),
    );
  }
}
