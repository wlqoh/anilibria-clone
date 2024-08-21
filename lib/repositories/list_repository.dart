// Dart imports:
import 'dart:convert';
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/models/paginated_response.dart';

abstract class ListRepository<T> {
  Dio backendApi;

  ListRepository(this.backendApi);

  T fromJson(Map<String, dynamic> json);

  String urlList();

  Future<PaginatedResponse<T>> list(
    int? nextPage,
  ) async {
    final response = await backendApi.get('${urlList()}?page=$nextPage');
    final List<T> items = [];

    for (final jsonItem in response.data['list']) {
      try {
        final item = fromJson(jsonItem);
        items.add(item);
      } catch (error, stackTrace) {
        printJsonDecodeError(error, stackTrace, jsonItem);
      }
    }
    return PaginatedResponse(items: items, page: 1, count: items.length);
  }

  void printJsonDecodeError(
    dynamic error,
    dynamic stackTrace,
    dynamic jsonItem,
  ) {
    log(logsDivider);
    log(error.toString());
    final lines = stackTrace.toString().split("\n");
    int index = 0;
    for (String line in lines) {
      if (line.startsWith("dart=sdk/lib/")) {
        continue;
      }
      line = line.replaceAll("packages/", "package:");
      line = line.replaceAll(".dart", ".dart:");
      line = line.split(" ").first;
      log("#$index ($line)");
      index += 1;
    }
    log("Source json:");
    final prettyJson = const JsonEncoder.withIndent("  ").convert(jsonItem);
    for (final line in prettyJson.split("\n")) {
      log(line);
    }
    log(logsDivider);
  }
}
