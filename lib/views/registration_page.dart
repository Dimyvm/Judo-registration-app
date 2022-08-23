import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/google_api_controller.dart';
import '../models/member_model.dart';
import '../widgets/person_tile.dart';

class RegistrationPage extends ConsumerWidget {
  
  const RegistrationPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State management
    final apiController = ref.watch(apiControllerProvider);

    
    
    final double heightMinAppbar = (MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top);

 
    final String group = ModalRoute.of(context)?.settings.arguments as String;

    List<Member> memberList = apiController.getMembersByGroup(group);

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
          itemCount: memberList.length,
          itemBuilder: (BuildContext context, int index) {
            return 
            PersonTile(heightMinAppbar: heightMinAppbar, name: '${memberList[index].surName}', isRegistered: false,);
   
          },
        ),
      ),
    );
  }
}
