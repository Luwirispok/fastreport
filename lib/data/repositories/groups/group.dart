import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/templates.dart';
import 'package:fastreport/domain/repositories/groups/group.dart';

class GetGroupRepositoryIdentificatorImpl
    implements GetGroupRepositoryIdentificator {
  @override
  get() async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      'api/manage/v1/Subscriptions?skip=0&take=10',
    );
  }
}

class GroupRepositoryAddGroupImpl implements GroupRepositoryAddGroup {
  addgroup(
    id,
    name,
    data,
  ) async {
    return await ApiRequest.postApiHelper(
      Dio(),
      {"name": "$name", "subscriptionId": "$id"},
      '',
    );
  }
}

class AddNewUSerRepositoryImpl implements AddNewUSerRepository {
  addNewUSer() async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      'api/manage/v1/Subscriptions?skip=0&take=10',
    );
  }
}

class GetUSerFromGroupImpl implements GetUSerFromGroup {
  getUSer() async {
    return await ApiRequest.getApiHelper(
      Dio(),
      {'': ''},
      'api/manage/v1/Subscriptions?skip=0&take=10',
    );
  }
}
