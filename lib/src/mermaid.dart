import 'dart:io';

import 'package:jaspr/server.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:jaspr_content/jaspr_content.dart';
import 'mermaid_render.dart';

class MermaidExtension extends PageExtension {
  MermaidExtension();

  @override
  Future<List<Node>> apply(Page page, List<Node> nodes) async {
    return [for (final node in nodes) await _processNode(node)];
  }

  Future<Node> _processNode(Node node) async {
    switch (node) {
      case TextNode():
        break;
      case ElementNode():
        final first = node.children?.first;
        if (first is ElementNode) {
          if (first.attributes.containsValue('language-mermaid')) {
            final mermaidString = _unescapeHtml(first.innerText);
            return ComponentNode(
              MermaidComponent(mermaidString: mermaidString),
            );
          }
        }
        break;
      case ComponentNode():
        break;
    }
    return node;
  }

  String _unescapeHtml(String htmlText) {
    final document = parse(htmlText);
    final String decoded = document.body?.text ?? document.text ?? "";
    return decoded;
  }
}

class MermaidComponent extends AsyncStatelessComponent {
  final String mermaidString;
  const MermaidComponent({super.key, required this.mermaidString});
  @override
  Future<Component> build(BuildContext context) async {
    final MermaidRender mermaidRender = .new();
    final String uuid = fastHash(mermaidString).toString();
    final String svgDir = 'images/mermaid/$uuid.svg';
    final File file = kDebugMode ? .new('./web/$svgDir') : .new(svgDir);
    if (!await file.exists()) {
      mermaidRender.subProcess(mermaidString, uuid);
    }
    //TODO: return as svg
    return img(src: svgDir);
  }
}
