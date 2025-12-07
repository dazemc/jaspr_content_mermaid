import 'dart:isolate';
import 'dart:io';

class Grammar {
  const Grammar();
  }

String loadGrammar(String fileName) {
  final file = Isolate.resolvePackageUriSync(
    Uri.parse("package:jaspr_content_ext/src/json/$fileName"),
  );
  return File(file!.path).readAsStringSync();
  }
  
  extension GrammarExtension on Grammar {    String get prompt => loadGrammar('prompt.tmLanguage.json');
    String get razor => loadGrammar('cshtml.tmLanguage.json');
    String get shaderlab => loadGrammar('shaderlab.tmLanguage.json');
    String get docker => loadGrammar('docker.tmLanguage.json');
    String get dotenv => loadGrammar('dotenv.tmLanguage.json');
    String get go => loadGrammar('go.tmLanguage.json');
    String get python => loadGrammar('MagicPython.tmLanguage.json');
    String get css => loadGrammar('css.tmLanguage.json');
    String get clojure => loadGrammar('clojure.tmLanguage.json');
    String get less => loadGrammar('less.tmLanguage.json');
    String get dart => loadGrammar('dart.tmLanguage.json');
    String get latex => loadGrammar('TeX.tmLanguage.json');
    String get scss => loadGrammar('scss.tmLanguage.json');
    String get perl => loadGrammar('perl.tmLanguage.json');
    String get rust => loadGrammar('rust.tmLanguage.json');
    String get pug => loadGrammar('pug.tmLanguage.json');
    String get fsharp => loadGrammar('fsharp.tmLanguage.json');
    String get r => loadGrammar('r.tmLanguage.json');
    String get java => loadGrammar('java.tmLanguage.json');
    String get diff => loadGrammar('diff.tmLanguage.json');
    String get html => loadGrammar('html.tmLanguage.json');
    String get php => loadGrammar('php.tmLanguage.json');
    String get lua => loadGrammar('lua.tmLanguage.json');
    String get xml => loadGrammar('xml.tmLanguage.json');
    String get vb => loadGrammar('asp-vb-net.tmLanguage.json');
    String get powershell => loadGrammar('powershell.tmLanguage.json');
    String get typescript => loadGrammar('TypeScript.tmLanguage.json');
    String get ini => loadGrammar('ini.tmLanguage.json');
    String get json => loadGrammar('JSON.tmLanguage.json');
    String get gitBase => loadGrammar('git-commit.tmLanguage.json');
    String get handlebars => loadGrammar('Handlebars.tmLanguage.json');
    String get cpp => loadGrammar('c.tmLanguage.json');
    String get swift => loadGrammar('swift.tmLanguage.json');
    String get make => loadGrammar('make.tmLanguage.json');
    String get shellscript => loadGrammar('shell-unix-bash.tmLanguage.json');
    String get markdown => loadGrammar('markdown.tmLanguage.json');
    String get markdownMath => loadGrammar('md-math.tmLanguage.json');
    String get yaml => loadGrammar('yaml.tmLanguage.json');
    String get log => loadGrammar('log.tmLanguage.json');
    String get csharp => loadGrammar('csharp.tmLanguage.json');
    String get julia => loadGrammar('julia.tmLanguage.json');
    String get bat => loadGrammar('batchfile.tmLanguage.json');
    String get groovy => loadGrammar('groovy.tmLanguage.json');
    String get coffeescript => loadGrammar('coffeescript.tmLanguage.json');
    String get javascript => loadGrammar('JavaScriptReact.tmLanguage.json');
    String get hlsl => loadGrammar('hlsl.tmLanguage.json');
    String get restructuredtext => loadGrammar('rst.tmLanguage.json');
    String get objectiveC => loadGrammar('objective-c.tmLanguage.json');
    String get ruby => loadGrammar('ruby.tmLanguage.json');
    String get searchResult => loadGrammar('searchResult.tmLanguage.json');
    String get sql => loadGrammar('sql.tmLanguage.json');
  }