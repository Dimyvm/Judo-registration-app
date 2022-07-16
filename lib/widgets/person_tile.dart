import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  final double heightMinAppbar;
  final String name;
  final bool isRegistered;
  const PersonTile({Key? key, required this.heightMinAppbar, required this.name, required this.isRegistered}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      name,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Spacer(),
                    Icon(Icons.sports_kabaddi, color: isRegistered ? Colors.lime : Colors.grey, size: 32,),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(Icons.start_outlined, size: 32,)),
                  ],
                ),
              ),
            );
    
  }
}