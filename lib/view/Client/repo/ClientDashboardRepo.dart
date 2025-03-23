import 'package:trainr/customServices/FilterForm.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';
import 'package:trainr/network/ApiServiceImpl.dart';
import 'package:trainr/view/repo/BaseRepo.dart';

class ClientDashboardRepo extends BaseRepo {
  Future<GetAllSessionResponse?> getAllSessions(
      String scheduleDate, FilterForm form) async {
    final response =
        await ApiServiceImpl.instance.getAllSessions(scheduleDate, form);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
