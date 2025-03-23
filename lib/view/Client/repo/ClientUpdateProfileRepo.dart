import 'package:dio/dio.dart';
import 'package:trainr/customServices/UpdateClientProfile.dart';
import 'package:trainr/network/ApiServiceImpl.dart';
import 'package:trainr/view/repo/BaseRepo.dart';

class ClientUpdateProfileRepo extends BaseRepo {

  Future<Response?> updateClientProfile(UpdateClientProfile profileData) async {
    return await ApiServiceImpl.instance.updateClientProfile(profileData);
  }
}
