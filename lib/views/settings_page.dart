import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heightMinAppbar = (MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instellingen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('time of registratio before and after starting time'),
            const SizedBox(
              height: 100,
            ),
            const Text('periodicity data loading'),
            const SizedBox(
              height: 100,
            ),
            const Text('minutes when screensaver start'),
            const SizedBox(
              height: 100,
            ),
            const Text('loading avatar images'),
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              // child: Container(
              //   width: double.infinity,
              //   height: (heightMinAppbar / 7) - 20,
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         radius: 30,
              //         backgroundColor: Colors.purple[100],
              //         child: const Icon(Icons.person, size: 32),
              //       ),
              //       const SizedBox(width: 20.0),
              //       const Text(
              //         'test',
              //         style: TextStyle(fontSize: 24),
              //       ),
              //       const Spacer(),
              //       const Icon(Icons.sports_kabaddi, color: Colors.lime,size: 32),
              //       const SizedBox(
              //         width: 20.0,
              //       ),
              //       IconButton(
              //         onPressed: () {},
              //         icon: const Icon(Icons.start_outlined, size: 32),
              //       ),
              //     ],
              //   ),
              // ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12.0),
                title: const Text(
                  'test',
                  style: TextStyle(fontSize: 24),
                ),
                leading: Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Icon(Icons.person, size: 32),
                ),
                subtitle: const Text(
                  'test',
                  style: TextStyle(fontSize: 24),
                ),
                trailing:
                    ElevatedButton(onPressed: () {}, child: const Text('test')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
