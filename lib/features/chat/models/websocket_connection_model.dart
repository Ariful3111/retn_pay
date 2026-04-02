import 'dart:convert';

class WebSocketConnectionMessage {
  final String? event;
  final dynamic data;

  const WebSocketConnectionMessage({this.event, this.data});

  factory WebSocketConnectionMessage.fromJson(Map<String, dynamic> json) {
    return WebSocketConnectionMessage(
      event: json['event']?.toString(),
      data: json['data'],
    );
  }

  static WebSocketConnectionMessage? fromRaw(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      final message = WebSocketConnectionMessage.fromJson(decoded);
      final data = message.data;
      if (data is String) {
        final trimmed = data.trim();
        if (trimmed.startsWith('{') || trimmed.startsWith('[')) {
          try {
            final parsedData = jsonDecode(trimmed);
            return WebSocketConnectionMessage(
              event: message.event,
              data: parsedData,
            );
          } catch (_) {
            return message;
          }
        }
      }
      return message;
    } catch (_) {
      return null;
    }
  }
}

class WebSocketConnectionEstablishedData {
  final String? socketId;
  final int? activityTimeout;

  const WebSocketConnectionEstablishedData({
    this.socketId,
    this.activityTimeout,
  });

  factory WebSocketConnectionEstablishedData.fromJson(
    Map<String, dynamic> json,
  ) {
    return WebSocketConnectionEstablishedData(
      socketId: json['socket_id']?.toString(),
      activityTimeout: _toInt(json['activity_timeout']),
    );
  }

  static WebSocketConnectionEstablishedData? fromDynamic(dynamic value) {
    if (value is Map<String, dynamic>) {
      return WebSocketConnectionEstablishedData.fromJson(value);
    }
    return null;
  }
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  return int.tryParse(value.toString());
}
