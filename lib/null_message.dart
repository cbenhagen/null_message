
import 'dart:async';

import 'package:flutter/services.dart';

class NullMessage {
  static Future<void> initialize() async {
    const BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'com.example.initialize', StandardMessageCodec());
    final Map<Object?, Object?>? replyMap =
    await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
      replyMap['error'] as Map<Object?, Object?>;
      throw PlatformException(
        code: error['code'] as String,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      // noop
    }
  }
}
