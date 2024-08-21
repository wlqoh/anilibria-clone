// Dart imports:
import 'dart:convert';
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/models/article/article.dart';

class ScheduleListRepository {
  final _url = "/title/schedule";

  Future<List<Main>> list() async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.anilibria.tv/v3'));
    final response = await dio.get(_url);
    final List<Main> items = [];
    for (final listItem in response.data) {
      try {
        final item = Main.fromJson(listItem);
        items.add(item);
      } catch (error, stackTrace) {
        printJsonDecodeError(error, stackTrace, listItem);
      }
    }

    return items;
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
