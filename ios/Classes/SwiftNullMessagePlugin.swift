import Flutter
import UIKit

public class SwiftNullMessagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterBasicMessageChannel.init(name: "com.example.initialize", binaryMessenger: registrar.messenger())
    channel.setMessageHandler { (_ message, callback) in
        print("Initializing..")
        callback(["result": nil, "error": nil])
    }
  }
}
