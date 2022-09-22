import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:user_profiler/display_data/back/display_data_vm.dart';

class DisplayData extends StatelessWidget {
  DisplayData({Key? key}) : super(key: key);

  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DisplayDataVM>.reactive(
      viewModelBuilder: () => DisplayDataVM(),
      onModelReady: ((model) async {}),
      builder: (context, viewModel, child) => SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            IconButton(
                onPressed: () => viewModel.searchPhrase('PEPEGA'),
                icon: const Icon(Icons.ice_skating)),
            TextButton(
                onPressed: () => viewModel.printData(),
                child: const Text('print data to log')),
            TextButton(
                onPressed: () {
                  if (listScrollController.hasClients) {
                    final position =
                        listScrollController.position.maxScrollExtent;
                    listScrollController.jumpTo(position);
                  }
                },
                child: const Text('scroll')),
            Expanded(
              child: viewModel.entries.isNotEmpty
                  ? ListView.builder(
                      controller: listScrollController,
                      itemCount: viewModel.entries.length,
                      itemBuilder: (context, int) => ListTile(
                            title: Text(viewModel.entries[int].toString()),
                          ))
                  : Container(),
            )
          ],
        ),
      )),
    );
  }
}
