import 'package:flutter/material.dart';
import 'package:apidash/consts.dart';

@immutable
class SettingsModel {
  const SettingsModel({
    this.isDark = false,
    this.alwaysShowCollectionPaneScrollbar = true,
    this.size,
    this.offset,
    this.defaultUriScheme = kDefaultUriScheme,
    this.defaultCodeGenLang = CodegenLanguage.curl,
    this.saveResponses = true,
    this.promptBeforeClosing = true,
    this.connectionTimeout = kDefaultConnectionTimeout
  });

  final bool isDark;
  final bool alwaysShowCollectionPaneScrollbar;
  final Size? size;
  final Offset? offset;
  final String defaultUriScheme;
  final CodegenLanguage defaultCodeGenLang;
  final bool saveResponses;
  final bool promptBeforeClosing;
  final int connectionTimeout;

  SettingsModel copyWith({
    bool? isDark,
    bool? alwaysShowCollectionPaneScrollbar,
    Size? size,
    Offset? offset,
    String? defaultUriScheme,
    CodegenLanguage? defaultCodeGenLang,
    bool? saveResponses,
    bool? promptBeforeClosing,
    int? connectionTimeout
  }) {
    return SettingsModel(
      isDark: isDark ?? this.isDark,
      alwaysShowCollectionPaneScrollbar: alwaysShowCollectionPaneScrollbar ??
          this.alwaysShowCollectionPaneScrollbar,
      size: size ?? this.size,
      defaultUriScheme: defaultUriScheme ?? this.defaultUriScheme,
      defaultCodeGenLang: defaultCodeGenLang ?? this.defaultCodeGenLang,
      offset: offset ?? this.offset,
      saveResponses: saveResponses ?? this.saveResponses,
      promptBeforeClosing: promptBeforeClosing ?? this.promptBeforeClosing,
      connectionTimeout: connectionTimeout ?? this.connectionTimeout
    );
  }

  factory SettingsModel.fromJson(Map<dynamic, dynamic> data) {
    final isDark = data["isDark"] as bool?;
    final alwaysShowCollectionPaneScrollbar =
        data["alwaysShowCollectionPaneScrollbar"] as bool?;
    final width = data["width"] as double?;
    final height = data["height"] as double?;
    final dx = data["dx"] as double?;
    final dy = data["dy"] as double?;
    Size? size;
    if (width != null && height != null) {
      size = Size(width, height);
    }
    Offset? offset;
    if (dx != null && dy != null) {
      offset = Offset(dx, dy);
    }
    final defaultUriScheme = data["defaultUriScheme"] as String?;
    final defaultCodeGenLangStr = data["defaultCodeGenLang"] as String?;
    CodegenLanguage? defaultCodeGenLang;
    if (defaultCodeGenLangStr != null) {
      try {
        defaultCodeGenLang =
            CodegenLanguage.values.byName(defaultCodeGenLangStr);
      } catch (e) {
        // pass
      }
    }
    final saveResponses = data["saveResponses"] as bool?;
    final promptBeforeClosing = data["promptBeforeClosing"] as bool?;
    final connectionTimeoutVal = data["connectionTimeout"] as int?;
    int? connectionTimeout;
    if(connectionTimeoutVal != null) {
      connectionTimeout = connectionTimeoutVal;
    }

    const sm = SettingsModel();

    return sm.copyWith(
        isDark: isDark,
        alwaysShowCollectionPaneScrollbar: alwaysShowCollectionPaneScrollbar,
        size: size,
        offset: offset,
        defaultUriScheme: defaultUriScheme,
        defaultCodeGenLang: defaultCodeGenLang,
        saveResponses: saveResponses,
        promptBeforeClosing: promptBeforeClosing,
        connectionTimeout: connectionTimeout
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "isDark": isDark,
      "alwaysShowCollectionPaneScrollbar": alwaysShowCollectionPaneScrollbar,
      "width": size?.width,
      "height": size?.height,
      "dx": offset?.dx,
      "dy": offset?.dy,
      "defaultUriScheme": defaultUriScheme,
      "defaultCodeGenLang": defaultCodeGenLang.name,
      "saveResponses": saveResponses,
      "promptBeforeClosing": promptBeforeClosing,
      "connectionTimeout": connectionTimeout
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator ==(Object other) {
    return other is SettingsModel &&
        other.runtimeType == runtimeType &&
        other.isDark == isDark &&
        other.alwaysShowCollectionPaneScrollbar ==
            alwaysShowCollectionPaneScrollbar &&
        other.size == size &&
        other.offset == offset &&
        other.defaultUriScheme == defaultUriScheme &&
        other.defaultCodeGenLang == defaultCodeGenLang &&
        other.saveResponses == saveResponses &&
        other.promptBeforeClosing == promptBeforeClosing &&
        other.connectionTimeout == connectionTimeout;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      isDark,
      alwaysShowCollectionPaneScrollbar,
      size,
      offset,
      defaultUriScheme,
      defaultCodeGenLang,
      saveResponses,
      promptBeforeClosing,
      connectionTimeout
    );
  }
}
