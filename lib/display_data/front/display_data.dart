import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:user_profiler/display_data/back/display_data_vm.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DisplayDataVM>.reactive(
      viewModelBuilder: () => DisplayDataVM(),
      onModelReady: ((model) async {
         model.loadedPage = await  model.loadPage();
         await model.addEntry();

      }),
      builder: (context, viewModel, child) => SafeArea(child: Scaffold(
        body: ListView(
              children: [
                //Text(viewModel.loadedPage),
                IconButton(onPressed: () => viewModel.showData(), icon: const Icon(Icons.ice_skating)),
              ],
            ),
      )),
    );
  }
}
