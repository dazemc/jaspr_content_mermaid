import 'dart:convert';
import 'dart:io';

void main() async {
  final genDir = await Directory("generated").create();
  final rootDirPath = '../src/vscode/extensions/';
  final extDir = Directory(rootDirPath);
  final jsonFileList = await extDir.exists()
      ? await getJsonPaths(extDir)
      : exit(1);
  final jsonList = await decodeJsonList(jsonFileList);
  final uniqueNameList = getUniqueNames(jsonList);
  final grammarLangEnum = generateGrammarExtension(uniqueNameList, jsonList);
  copyJson(jsonFileList, genDir);
  generate(grammarLangEnum, genDir);
}

Future<void> copyJson(List<File> jsonFileList, Directory genDir) async {
  final dir = Directory('${genDir.path}/json/');
  await dir.create();
  for (var j in jsonFileList) {
    final basename = j.path.substring(j.parent.path.length);
    await j.copy("${dir.path}/$basename");
  }
}

String formatName(String name) {
  var finalName = "";
  final split = name.split('-');
  for (int i = 0; i < split.length; i++) {
    if (i > 0 && !split[i].contains('-')) {
      finalName += "${split[i][0].toUpperCase()}${split[i].substring(1)}";
    } else {
      finalName += split[i];
    }
  }
  return finalName;
}

String getExtensionHeader(String title) {
  return '''
import 'dart:io';

class Grammar {
  const Grammar();
  }

extension $title on Grammar {
''';
}

String generateGrammarExtension(
  List<String> uniqueNameList,
  List<Map> jsonList,
) {
  final header = getExtensionHeader("GrammarExtension");
  String body = "";
  final footer = "  }";
  for (var name in uniqueNameList) {
    final current = jsonList.firstWhere((e) => e["name"] == name);
    final file = File("json/${current["fileName"]}");
    body +=
        '''    String get ${formatName(name)} => File("${file.path}").readAsStringSync();\n''';
  }
  return "$header$body$footer";
}

List<String> getUniqueNames(List<Map> jsonList) {
  List<String> uniqueNames = <String>[];
  for (var element in jsonList) {
    if (!uniqueNames.contains(element["name"])) {
      uniqueNames.add(element["name"]);
    }
  }
  return uniqueNames;
}

Future<void> generate(String output, Directory genDir) async {
  final outfile = File("${genDir.path}/grammars.dart");
  await outfile.create();
  outfile.writeAsString(output);
}

Future<List<Map>> decodeJsonList(List<File> jsonFileList) async {
  List<Map> jsonList = [];
  for (File json in jsonFileList) {
    final packageJson =
        jsonDecode(
              await File(
                "${json.parent.parent.path}/package.json",
              ).readAsString(),
            )
            as Map;
    final langName =
        (packageJson["contributes"]["languages"] as List).first["id"];
    final langJson = jsonDecode(await json.readAsString());
    final fileName = json.path.substring(json.parent.path.length + 1);
    jsonList.add({"name": langName, "fileName": fileName, "content": langJson});
  }
  return jsonList;
}

Future<List<File>> getJsonPaths(Directory extDir) async {
  final dirContents = extDir.list(recursive: true, followLinks: false);
  List<File> jsonLoc = [];
  await dirContents.forEach((e) {
    e.path.contains('tmLanguage.json') ? jsonLoc.add(File(e.path)) : {};
  });
  return jsonLoc;
}
