import 'package:flutter/material.dart';

/// Reparte el contenido auth: cabecera arriba, cuerpo flexible, pie abajo.
class AlianzaAuthPageLayout extends StatelessWidget {
  const AlianzaAuthPageLayout({
    super.key,
    required this.header,
    required this.body,
    required this.footer,
    this.bottom,
    this.centerBody = false,
    this.horizontalPadding = 26,
    this.topPadding = 16,
    this.headerGap = 20,
    this.bottomPadding = 20,
  });

  final Widget header;
  final Widget body;
  final Widget footer;
  final Widget? bottom;
  /// Si true, centra el cuerpo (formularios). Si false, el body llena el espacio (PageView).
  final bool centerBody;
  final double horizontalPadding;
  final double topPadding;
  final double headerGap;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        bottomPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header,
          SizedBox(height: headerGap),
          Expanded(
            child: centerBody
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [body],
                          ),
                        ),
                      );
                    },
                  )
                : body,
          ),
          if (bottom != null) ...[
            bottom!,
            const SizedBox(height: 16),
          ],
          footer,
        ],
      ),
    );
  }
}
