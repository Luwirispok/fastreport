import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fastreport/data/repositories/apiRequests.dart';
import 'package:fastreport/domain/repositories/docum/templates.dart';

abstract class GroupRepositoryAddGroup {
  addgroup(
    id,
    name,
    data,
  ) {}
}

abstract class AddNewUSerRepository {
  addNewUSer() {}
}

class GetUSerFromGroup {
  getUSer() {}
}

abstract class GetGroupRepositoryIdentificator {
  get();
}
