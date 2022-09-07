import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/google_api_controller.dart';
import '../models/member_model.dart';

class PersonTile extends ConsumerWidget {
  final double heightMinAppbar;
  final Member member;
  final bool isRegistered;
  const PersonTile({Key? key, required this.heightMinAppbar, required this.member, required this.isRegistered}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State management
    final apiController = ref.watch(apiControllerProvider);

    return
    Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: (heightMinAppbar / 7) - 20,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '${member.surName} ${member.name}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Spacer(),
                    Icon(Icons.sports_kabaddi, color: isRegistered ? Colors.lime : Colors.grey, size: 32,),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                        onPressed: () async{
                          bool registered =  await apiController.postDataToApi(member);
                          if(registered){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.lightGreen,
                              content: Text("Registered"),
                            ));
                            Navigator.pop(context);
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text("Plaese try again and check your internet connection"),
                            ));
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.start_outlined, size: 32,)),
                  ],
                ),
              ),
            );
    
  }
}