// import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Client%20Home/Client-Home-view/C-ProfileImage%20alert/C-ProfileImageAlert_viewModel.dart';

class CprofileImageAlertView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*ViewModelBuilder<CProfileImageAlertViewmodel>.reactive(
      viewModelBuilder: () => CProfileImageAlertViewmodel(),
      builder: (context, viewModel, child) => AlertDialog(
        title: const Text('Profile'),
        content: CircleAvatar(
          backgroundImage: viewModel.isLoading
              ? null
              : viewModel.clientData!.userImg != null
                  ? NetworkImage(viewModel.clientData!.userImg!)
                  : null,
          radius: MediaQuery.of(context).size.width * 0.2,
          child: viewModel.isLoading
              ? const CircularProgressIndicator()
              : viewModel.clientData!.userImg == null
                  ? const Icon(Icons.person)
                  : null,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              viewModel.navigateToClientProfileView();
            },
            child: const Text('View Profile'),
          ),
          TextButton(
            onPressed: () async {
              var result =
                  await FilePicker.platform.pickFiles(allowMultiple: true);
              if (result == null) {
                print("No file selected");
              } else {
                viewModel.filePakar(result);
                viewModel.uploadImage();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("message"),
                  ),
                );
              }
            },
            child: const Text('Change Profile Pic'),
          ),
        ],
      ),
    );
  }*/
        Container();
  }
}
