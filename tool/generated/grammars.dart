import 'dart:io';

class Grammar {
  const Grammar();
  }

extension GrammarExtension on Grammar {
    String get prompt => File("json/prompt.tmLanguage.json").readAsStringSync();
    String get razor => File("json/cshtml.tmLanguage.json").readAsStringSync();
    String get shaderlab => File("json/shaderlab.tmLanguage.json").readAsStringSync();
    String get dockerfile => File("json/docker.tmLanguage.json").readAsStringSync();
    String get dotenv => File("json/dotenv.tmLanguage.json").readAsStringSync();
    String get go => File("json/go.tmLanguage.json").readAsStringSync();
    String get python => File("json/MagicRegExp.tmLanguage.json").readAsStringSync();
    String get css => File("json/css.tmLanguage.json").readAsStringSync();
    String get clojure => File("json/clojure.tmLanguage.json").readAsStringSync();
    String get less => File("json/less.tmLanguage.json").readAsStringSync();
    String get dart => File("json/dart.tmLanguage.json").readAsStringSync();
    String get tex => File("json/LaTeX.tmLanguage.json").readAsStringSync();
    String get scss => File("json/scss.tmLanguage.json").readAsStringSync();
    String get perl => File("json/perl6.tmLanguage.json").readAsStringSync();
    String get rust => File("json/rust.tmLanguage.json").readAsStringSync();
    String get jade => File("json/pug.tmLanguage.json").readAsStringSync();
    String get fsharp => File("json/fsharp.tmLanguage.json").readAsStringSync();
    String get r => File("json/r.tmLanguage.json").readAsStringSync();
    String get java => File("json/java.tmLanguage.json").readAsStringSync();
    String get diff => File("json/diff.tmLanguage.json").readAsStringSync();
    String get html => File("json/html-derivative.tmLanguage.json").readAsStringSync();
    String get php => File("json/php.tmLanguage.json").readAsStringSync();
    String get lua => File("json/lua.tmLanguage.json").readAsStringSync();
    String get xml => File("json/xml.tmLanguage.json").readAsStringSync();
    String get vb => File("json/asp-vb-net.tmLanguage.json").readAsStringSync();
    String get powershell => File("json/powershell.tmLanguage.json").readAsStringSync();
    String get typescript => File("json/jsdoc.js.injection.tmLanguage.json").readAsStringSync();
    String get ini => File("json/ini.tmLanguage.json").readAsStringSync();
    String get json => File("json/JSONL.tmLanguage.json").readAsStringSync();
    String get gitCommit => File("json/git-rebase.tmLanguage.json").readAsStringSync();
    String get handlebars => File("json/Handlebars.tmLanguage.json").readAsStringSync();
    String get c => File("json/platform.tmLanguage.json").readAsStringSync();
    String get swift => File("json/swift.tmLanguage.json").readAsStringSync();
    String get makefile => File("json/make.tmLanguage.json").readAsStringSync();
    String get shellscript => File("json/shell-unix-bash.tmLanguage.json").readAsStringSync();
    String get markdown => File("json/markdown.tmLanguage.json").readAsStringSync();
    String get markdownMath => File("json/md-math-block.tmLanguage.json").readAsStringSync();
    String get dockercompose => File("json/yaml-1.0.tmLanguage.json").readAsStringSync();
    String get log => File("json/log.tmLanguage.json").readAsStringSync();
    String get csharp => File("json/csharp.tmLanguage.json").readAsStringSync();
    String get julia => File("json/julia.tmLanguage.json").readAsStringSync();
    String get bat => File("json/batchfile.tmLanguage.json").readAsStringSync();
    String get groovy => File("json/groovy.tmLanguage.json").readAsStringSync();
    String get coffeescript => File("json/coffeescript.tmLanguage.json").readAsStringSync();
    String get javascriptreact => File("json/JavaScript.tmLanguage.json").readAsStringSync();
    String get hlsl => File("json/hlsl.tmLanguage.json").readAsStringSync();
    String get restructuredtext => File("json/rst.tmLanguage.json").readAsStringSync();
    String get objectiveC => File("json/objective-c.tmLanguage.json").readAsStringSync();
    String get ruby => File("json/ruby.tmLanguage.json").readAsStringSync();
    String get searchResult => File("json/searchResult.tmLanguage.json").readAsStringSync();
    String get sql => File("json/sql.tmLanguage.json").readAsStringSync();
  }