import 'theme.dart';

class TableTheme {
  TableTheme({
    this.fontStyle,
    this.width,
    this.borderBottomBackground,
    this.borderTop,
    this.isShowBorderRight,
    this.isShowBorderLeft,
    this.isShowBorderBottom,
    this.paddingTop,
    this.paddingRight,
    this.paddingLeft,
    this.paddingBottom,
    this.height,
    this.fontColor,
    this.fontBackground,
    this.textAlign,
    this.cornerTopRightColor,
    this.cornerTopRightBackground,
    this.cornerTopRight,
    this.cornerTopLeftColor,
    this.cornerTopLeftBackground,
    this.cornerTopLeft,
    this.cornerBottomRightColor,
    this.cornerBottomRightBackground,
    this.cornerBottomRight,
    this.cornerBottomLeftColor,
    this.cornerBottomLeftBackground,
    this.cornerBottomLeft,
    this.columnSeparatorColor,
    this.columnSeparatorBackground,
    this.columnSeparator,
    this.borderTopColor,
    this.borderTopBackground,
    this.borderRightColor,
    this.borderRightBackground,
    this.borderRight,
    this.borderLeftColor,
    this.borderLeftBackground,
    this.borderLeft,
    this.borderBottom,
    this.isShowBorderTop,
    this.borderBottomColor,
  });

  factory TableTheme.from(TableTheme theme) => theme.copyWith();

  TableTheme copyWith({
    // Element width and height
    int? width,
    int? height,

    // Font styling
    TextAlign? textAlign,
    Set<FontStyle>? fontStyle,
    Color? fontColor,
    Color? fontBackground,

    // Element padding
    int? paddingLeft,
    int? paddingTop,
    int? paddingRight,
    int? paddingBottom,

    // Element border
    bool? isShowBorderTop,
    String? borderTop,
    Color? borderTopColor,
    Color? borderTopBackground,
    bool? isShowBorderBottom,
    String? borderBottom,
    Color? borderBottomColor,
    Color? borderBottomBackground,
    bool? isShowBorderLeft,
    String? borderLeft,
    Color? borderLeftColor,
    Color? borderLeftBackground,
    bool? isShowBorderRight,
    String? borderRight,
    Color? borderRightColor,
    Color? borderRightBackground,

    // Element corner
    String? cornerTopLeft,
    Color? cornerTopLeftColor,
    Color? cornerTopLeftBackground,
    String? cornerTopRight,
    Color? cornerTopRightColor,
    Color? cornerTopRightBackground,
    String? cornerBottomLeft,
    Color? cornerBottomLeftColor,
    Color? cornerBottomLeftBackground,
    String? cornerBottomRight,
    Color? cornerBottomRightColor,
    Color? cornerBottomRightBackground,

    // Element column separator
    String? columnSeparator,
    Color? columnSeparatorColor,
    Color? columnSeparatorBackground,
  }) {
    return TableTheme(
      borderBottomBackground:
          borderBottomBackground ?? this.borderBottomBackground,
      borderBottom: borderBottom ?? this.borderBottom,
      borderBottomColor: borderBottomColor ?? this.borderBottomColor,
      borderLeft: borderLeft ?? this.borderLeft,
      borderLeftBackground: borderLeftBackground ?? this.borderLeftBackground,
      borderLeftColor: borderLeftColor ?? this.borderLeftColor,
      borderRight: borderRight ?? this.borderRight,
      borderRightBackground:
          borderRightBackground ?? this.borderRightBackground,
      borderRightColor: borderRightColor ?? this.borderRightColor,
      borderTop: borderTop ?? this.borderTop,
      borderTopBackground: borderTopBackground ?? this.borderTopBackground,
      borderTopColor: borderTopColor ?? this.borderTopColor,
      columnSeparator: columnSeparator ?? this.columnSeparator,
      columnSeparatorBackground:
          columnSeparatorBackground ?? this.columnSeparatorBackground,
      columnSeparatorColor: columnSeparatorColor ?? this.columnSeparatorColor,
      cornerBottomLeft: cornerBottomLeft ?? this.cornerBottomLeft,
      cornerBottomLeftBackground:
          cornerBottomLeftBackground ?? this.cornerBottomLeftBackground,
      cornerBottomLeftColor:
          cornerBottomLeftColor ?? this.cornerBottomLeftColor,
      cornerBottomRight: cornerBottomRight ?? this.cornerBottomRight,
      cornerBottomRightBackground:
          cornerBottomRightBackground ?? this.cornerBottomRightBackground,
      cornerBottomRightColor:
          cornerBottomRightColor ?? this.cornerBottomRightColor,
      cornerTopLeft: cornerTopLeft ?? this.cornerTopLeft,
      cornerTopLeftBackground:
          cornerTopLeftBackground ?? this.cornerTopLeftBackground,
      cornerTopLeftColor: cornerTopLeftColor ?? this.cornerTopLeftColor,
      cornerTopRight: cornerTopRight ?? this.cornerTopRight,
      cornerTopRightBackground:
          cornerTopRightBackground ?? this.cornerTopRightBackground,
      cornerTopRightColor: cornerTopRightColor ?? this.cornerTopRightColor,
      textAlign: textAlign ?? this.textAlign,
      fontBackground: fontBackground ?? this.fontBackground,
      fontColor: fontColor ?? this.fontColor,
      fontStyle: fontStyle ?? Set.from(this.fontStyle ?? {}),
      height: height ?? this.height,
      paddingBottom: paddingBottom ?? this.paddingBottom,
      paddingLeft: paddingLeft ?? this.paddingLeft,
      paddingRight: paddingRight ?? this.paddingRight,
      paddingTop: paddingTop ?? this.paddingTop,
      isShowBorderBottom: isShowBorderBottom ?? this.isShowBorderBottom,
      isShowBorderLeft: isShowBorderLeft ?? this.isShowBorderLeft,
      isShowBorderRight: isShowBorderRight ?? this.isShowBorderRight,
      isShowBorderTop: isShowBorderTop ?? this.isShowBorderTop,
      width: width ?? this.width,
    );
  }

  TableTheme setWidth(int value) {
    width = value;
    return this;
  }

  TableTheme setHeight(int value) {
    height = value;
    return this;
  }

  TableTheme setPadding(int value) {
    paddingLeft = value;
    paddingRight = value;
    paddingTop = value;
    paddingBottom = value;
    return this;
  }

  TableTheme setPaddingLeft(int value) {
    paddingLeft = value;
    return this;
  }

  TableTheme setPaddingRight(int value) {
    paddingRight = value;
    return this;
  }

  TableTheme setPaddingTop(int value) {
    paddingTop = value;
    return this;
  }

  TableTheme setPaddingBottom(int value) {
    paddingBottom = value;
    return this;
  }

  TableTheme setBorder(String value) {
    borderLeft = value;
    borderRight = value;
    borderTop = value;
    borderBottom = value;
    return this;
  }

  TableTheme setBorderColor(Color value) {
    borderLeftColor = value;
    borderRightColor = value;
    borderTopColor = value;
    borderBottomColor = value;
    return this;
  }

  TableTheme setBorderBackground(Color value) {
    borderLeftBackground = value;
    borderRightBackground = value;
    borderTopBackground = value;
    borderBottomBackground = value;
    return this;
  }

  TableTheme setBorderLeft(String value) {
    borderLeft = value;
    return this;
  }

  TableTheme setBorderLeftColor(Color value) {
    borderLeftColor = value;
    return this;
  }

  TableTheme setBorderLeftBackground(Color value) {
    borderLeftBackground = value;
    return this;
  }

  TableTheme setBorderRight(String value) {
    borderRight = value;
    return this;
  }

  TableTheme setBorderRightColor(Color value) {
    borderRightColor = value;
    return this;
  }

  TableTheme setBorderRightBackground(Color value) {
    borderRightBackground = value;
    return this;
  }

  TableTheme setBorderTop(String value) {
    borderTop = value;
    return this;
  }

  TableTheme setBorderTopColor(Color value) {
    borderTopColor = value;
    return this;
  }

  TableTheme setBorderTopBackground(Color value) {
    borderTopBackground = value;
    return this;
  }

  TableTheme setBorderBottom(String value) {
    borderBottom = value;
    return this;
  }

  TableTheme setBorderBottomColor(Color value) {
    borderBottomColor = value;
    return this;
  }

  TableTheme setBorderBottomBackground(Color value) {
    borderBottomBackground = value;
    return this;
  }

  TableTheme showBorders() {
    isShowBorderTop = true;
    isShowBorderBottom = true;
    isShowBorderLeft = true;
    isShowBorderRight = true;
    return this;
  }

  TableTheme hideBorders() {
    isShowBorderTop = false;
    isShowBorderBottom = false;
    isShowBorderLeft = false;
    isShowBorderRight = false;
    return this;
  }

  TableTheme showBorderTop() {
    isShowBorderTop = true;
    return this;
  }

  TableTheme hideBorderTop() {
    isShowBorderTop = false;
    return this;
  }

  TableTheme showBorderBottom() {
    isShowBorderBottom = true;
    return this;
  }

  TableTheme hideBorderBottom() {
    isShowBorderBottom = false;
    return this;
  }

  TableTheme showBorderLeft() {
    isShowBorderLeft = true;
    return this;
  }

  TableTheme hideBorderLeft() {
    isShowBorderLeft = false;
    return this;
  }

  TableTheme showBorderRight() {
    isShowBorderRight = true;
    return this;
  }

  TableTheme hideBorderRight() {
    isShowBorderRight = false;
    return this;
  }

  TableTheme setCorner(String value) {
    cornerTopLeft = value;
    cornerTopRight = value;
    cornerBottomLeft = value;
    cornerBottomRight = value;
    return this;
  }

  TableTheme setCornerColor(Color value) {
    cornerTopLeftColor = value;
    cornerTopRightColor = value;
    cornerBottomLeftColor = value;
    cornerBottomRightColor = value;
    return this;
  }

  TableTheme setCornerBackground(Color value) {
    cornerTopLeftBackground = value;
    cornerTopRightBackground = value;
    cornerBottomLeftBackground = value;
    cornerBottomRightBackground = value;
    return this;
  }

  TableTheme setCornerTopLeft(String value) {
    cornerTopLeft = value;
    return this;
  }

  TableTheme setCornerTopLeftColor(Color value) {
    cornerTopLeftColor = value;
    return this;
  }

  TableTheme setCornerTopLeftBackground(Color value) {
    cornerTopLeftBackground = value;
    return this;
  }

  TableTheme setCornerTopRight(String value) {
    cornerTopRight = value;
    return this;
  }

  TableTheme setCornerTopRightColor(Color value) {
    cornerTopRightColor = value;
    return this;
  }

  TableTheme setCornerTopRightBackground(Color value) {
    cornerTopRightBackground = value;
    return this;
  }

  TableTheme setCornerBottomLeft(String value) {
    cornerBottomLeft = value;
    return this;
  }

  TableTheme setCornerBottomLeftColor(Color value) {
    cornerBottomLeftColor = value;
    return this;
  }

  TableTheme setCornerBottomLeftBackground(Color value) {
    cornerBottomLeftBackground = value;
    return this;
  }

  TableTheme setCornerBottomRight(String value) {
    cornerBottomRight = value;
    return this;
  }

  TableTheme setCornerBottomRightColor(Color value) {
    cornerBottomRightColor = value;
    return this;
  }

  TableTheme setCornerBottomRightBackground(Color value) {
    cornerBottomRightBackground = value;
    return this;
  }

  TableTheme setColumnSeparator(String value) {
    columnSeparator = value;
    return this;
  }

  TableTheme setColumnSeparatorColor(Color value) {
    columnSeparatorColor = value;
    return this;
  }

  TableTheme setColumnSeparatorBackground(Color value) {
    columnSeparatorBackground = value;
    return this;
  }

  TableTheme setTextAlign(TextAlign value) {
    textAlign = value;
    return this;
  }

  TableTheme setFontStyle(Set<FontStyle> styles) {
    if (fontStyle != null) {
      for (FontStyle style in styles) {
        fontStyle!.add(style);
      }
    } else {
      fontStyle = styles;
    }
    return this;
  }

  TableTheme setFontColor(Color value) {
    fontColor = value;
    return this;
  }

  TableTheme setFontBackground(Color value) {
    fontBackground = value;
    return this;
  }

  TableTheme setColor(Color value) {
    setFontColor(value);
    setBorderColor(value);
    setCornerColor(value);
    return this;
  }

  TableTheme setBackground(Color value) {
    setFontBackground(value);
    setBorderBackground(value);
    setCornerBackground(value);
    return this;
  }

  // Merge two themes
  // first has higher precedence
  // e.g., first = cell-level theming and
  // second = row-level theming
  // Result has attributes of both with cell-level
  // theming taking precedence
  static TableTheme merge(TableTheme first, TableTheme second) {
    TableTheme result = TableTheme();

    // Width and height
    if (first.width != null) {
      result.width = first.width;
    } else {
      result.width = second.width;
    }

    if (first.height != null) {
      result.height = first.height;
    } else {
      result.height = second.height;
    }

    // Font styling
    if (first.textAlign != null) {
      result.textAlign = first.textAlign;
    } else {
      result.textAlign = second.textAlign;
    }

    if (first.fontStyle != null) {
      List<FontStyle> fontStyles =
          first.fontStyle!.union(second.fontStyle ?? {}).toList();
      fontStyles.sort((a, b) => a.index.compareTo(b.index));
      result.fontStyle = fontStyles.toSet();
    } else {
      result.fontStyle = second.fontStyle;
    }

    if (first.fontColor != null) {
      result.fontColor = first.fontColor;
    } else {
      result.fontColor = second.fontColor;
    }

    if (first.fontBackground != null) {
      result.fontBackground = first.fontBackground;
    } else {
      result.fontBackground = second.fontBackground;
    }

    // Padding
    if (first.paddingLeft != null) {
      result.paddingLeft = first.paddingLeft;
    } else {
      result.paddingLeft = second.paddingLeft;
    }

    if (first.paddingTop != null) {
      result.paddingTop = first.paddingTop;
    } else {
      result.paddingTop = second.paddingTop;
    }

    if (first.paddingRight != null) {
      result.paddingRight = first.paddingRight;
    } else {
      result.paddingRight = second.paddingRight;
    }

    if (first.paddingBottom != null) {
      result.paddingBottom = first.paddingBottom;
    } else {
      result.paddingBottom = second.paddingBottom;
    }

    // Border
    if (first.borderLeft != null) {
      result.borderLeft = first.borderLeft;
    } else {
      result.borderLeft = second.borderLeft;
    }

    if (first.borderLeftColor != null) {
      result.borderLeftColor = first.borderLeftColor;
    } else {
      result.borderLeftColor = second.borderLeftColor;
    }

    if (first.borderLeftBackground != null) {
      result.borderLeftBackground = first.borderLeftBackground;
    } else {
      result.borderLeftBackground = second.borderLeftBackground;
    }

    if (first.borderTop != null) {
      result.borderTop = first.borderTop;
    } else {
      result.borderTop = second.borderTop;
    }

    if (first.borderTopColor != null) {
      result.borderTopColor = first.borderTopColor;
    } else {
      result.borderTopColor = second.borderTopColor;
    }

    if (first.borderTopBackground != null) {
      result.borderTopBackground = first.borderTopBackground;
    } else {
      result.borderTopBackground = second.borderTopBackground;
    }

    if (first.borderBottom != null) {
      result.borderBottom = first.borderBottom;
    } else {
      result.borderBottom = second.borderBottom;
    }

    if (first.borderBottomColor != null) {
      result.borderBottomColor = first.borderBottomColor;
    } else {
      result.borderBottomColor = second.borderBottomColor;
    }

    if (first.borderBottomBackground != null) {
      result.borderBottomBackground = first.borderBottomBackground;
    } else {
      result.borderBottomBackground = second.borderBottomBackground;
    }

    if (first.borderRight != null) {
      result.borderRight = first.borderRight;
    } else {
      result.borderRight = second.borderRight;
    }

    if (first.borderRightColor != null) {
      result.borderRightColor = first.borderRightColor;
    } else {
      result.borderRightColor = second.borderRightColor;
    }

    if (first.borderRightBackground != null) {
      result.borderRightBackground = first.borderRightBackground;
    } else {
      result.borderRightBackground = second.borderRightBackground;
    }

    if (first.isShowBorderTop != null) {
      result.isShowBorderTop = first.isShowBorderTop;
    } else {
      result.isShowBorderTop = second.isShowBorderTop;
    }

    if (first.isShowBorderBottom != null) {
      result.isShowBorderBottom = first.isShowBorderBottom;
    } else {
      result.isShowBorderBottom = second.isShowBorderBottom;
    }

    if (first.isShowBorderLeft != null) {
      result.isShowBorderLeft = first.isShowBorderLeft;
    } else {
      result.isShowBorderLeft = second.isShowBorderLeft;
    }

    if (first.isShowBorderRight != null) {
      result.isShowBorderRight = first.isShowBorderRight;
    } else {
      result.isShowBorderRight = second.isShowBorderRight;
    }

    // Corner
    if (first.cornerTopLeft != null) {
      result.cornerTopLeft = first.cornerTopLeft;
    } else {
      result.cornerTopLeft = second.cornerTopLeft;
    }

    if (first.cornerTopLeftColor != null) {
      result.cornerTopLeftColor = first.cornerTopLeftColor;
    } else {
      result.cornerTopLeftColor = second.cornerTopLeftColor;
    }

    if (first.cornerTopLeftBackground != null) {
      result.cornerTopLeftBackground = first.cornerTopLeftBackground;
    } else {
      result.cornerTopLeftBackground = second.cornerTopLeftBackground;
    }

    if (first.cornerTopRight != null) {
      result.cornerTopRight = first.cornerTopRight;
    } else {
      result.cornerTopRight = second.cornerTopRight;
    }

    if (first.cornerTopRightColor != null) {
      result.cornerTopRightColor = first.cornerTopRightColor;
    } else {
      result.cornerTopRightColor = second.cornerTopRightColor;
    }

    if (first.cornerTopRightBackground != null) {
      result.cornerTopRightBackground = first.cornerTopRightBackground;
    } else {
      result.cornerTopRightBackground = second.cornerTopRightBackground;
    }

    if (first.cornerBottomLeft != null) {
      result.cornerBottomLeft = first.cornerBottomLeft;
    } else {
      result.cornerBottomLeft = second.cornerBottomLeft;
    }

    if (first.cornerBottomLeftColor != null) {
      result.cornerBottomLeftColor = first.cornerBottomLeftColor;
    } else {
      result.cornerBottomLeftColor = second.cornerBottomLeftColor;
    }

    if (first.cornerBottomLeftBackground != null) {
      result.cornerBottomLeftBackground = first.cornerBottomLeftBackground;
    } else {
      result.cornerBottomLeftBackground = second.cornerBottomLeftBackground;
    }

    if (first.cornerBottomRight != null) {
      result.cornerBottomRight = first.cornerBottomRight;
    } else {
      result.cornerBottomRight = second.cornerBottomRight;
    }

    if (first.cornerBottomRightColor != null) {
      result.cornerBottomRightColor = first.cornerBottomRightColor;
    } else {
      result.cornerBottomRightColor = second.cornerBottomRightColor;
    }

    if (first.cornerBottomRightBackground != null) {
      result.cornerBottomRightBackground = first.cornerBottomRightBackground;
    } else {
      result.cornerBottomRightBackground = second.cornerBottomRightBackground;
    }

    // Column separator
    if (first.columnSeparator != null) {
      result.columnSeparator = first.columnSeparator;
    } else {
      result.columnSeparator = second.columnSeparator;
    }

    if (first.columnSeparatorColor != null) {
      result.columnSeparatorColor = first.columnSeparatorColor;
    } else {
      result.columnSeparatorColor = second.columnSeparatorColor;
    }

    if (first.columnSeparatorBackground != null) {
      result.columnSeparatorBackground = first.columnSeparatorBackground;
    } else {
      result.columnSeparatorBackground = second.columnSeparatorBackground;
    }

    return result;
  }

  void setDefaults() {
    // NOTE: width and height are not set here
    textAlign = TextAlign.left;
    fontStyle = {};
    fontColor = fontBackground = Color.none;
    paddingLeft = paddingRight = 1;
    paddingTop = paddingBottom = 0;
    borderTop = borderBottom = "-";
    borderLeft = borderRight = "|";
    isShowBorderLeft =
        isShowBorderRight = isShowBorderTop = isShowBorderBottom = true;
    borderTopColor = borderTopBackground = borderBottomColor =
        borderBottomBackground = borderLeftColor = borderLeftBackground =
            borderRightColor = borderRightBackground = Color.none;
    cornerTopLeft = cornerTopRight = cornerBottomLeft = cornerBottomRight = "+";
    cornerTopLeftColor = cornerTopLeftBackground = cornerTopRightColor =
        cornerTopRightBackground = cornerBottomLeftColor =
            cornerBottomLeftBackground = cornerBottomRightColor =
                cornerBottomRightBackground = Color.none;
    columnSeparator = "|";
    columnSeparatorColor = columnSeparatorBackground = Color.none;
  }

  // Element width and height
  int? width;
  int? height;

  // Font styling
  TextAlign? textAlign;
  Set<FontStyle>? fontStyle;
  Color? fontColor;
  Color? fontBackground;

  // Element padding
  int? paddingLeft;
  int? paddingTop;
  int? paddingRight;
  int? paddingBottom;

  // Element border
  bool? isShowBorderTop;
  String? borderTop;
  Color? borderTopColor;
  Color? borderTopBackground;

  bool? isShowBorderBottom;
  String? borderBottom;
  Color? borderBottomColor;
  Color? borderBottomBackground;

  bool? isShowBorderLeft;
  String? borderLeft;
  Color? borderLeftColor;
  Color? borderLeftBackground;

  bool? isShowBorderRight;
  String? borderRight;
  Color? borderRightColor;
  Color? borderRightBackground;

  // Element corner
  String? cornerTopLeft;
  Color? cornerTopLeftColor;
  Color? cornerTopLeftBackground;

  String? cornerTopRight;
  Color? cornerTopRightColor;
  Color? cornerTopRightBackground;

  String? cornerBottomLeft;
  Color? cornerBottomLeftColor;
  Color? cornerBottomLeftBackground;

  String? cornerBottomRight;
  Color? cornerBottomRightColor;
  Color? cornerBottomRightBackground;

  // Element column separator
  String? columnSeparator;
  Color? columnSeparatorColor;
  Color? columnSeparatorBackground;
}
