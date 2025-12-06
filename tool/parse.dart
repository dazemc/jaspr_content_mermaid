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
}

//TODO: This will be generated, pass to CodeBlock() by doing Grammar.dart.... I can do ext for variants like Grammar.c.platform, Grammar.c would still need a default though... oh package.json has vscodes default I can just use that;
// class Grammar {
//   String name = "dart";
//   String content = "json";
//   List<String>? variants;
//   Grammar(this.name, this.content);
// }

Future<void> generate(List<Map> jsonList, Directory genDir) async {
  //TODO:
  for (var json in jsonList) {
    final fileName = genDir.path.toString() + json["name"] + ".dart";
    final file = File(fileName);
    // if (await file.exists()) {}
    // file.writeAsString(json["contents"]);
  }
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
    jsonList.add({"name": langName, "content": langJson});
    if (langName == "c") {
      print(json.path);
    }
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
