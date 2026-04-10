import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

  private let CHANNEL = "com.example/native"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)

    if let controller = window?.rootViewController as? FlutterViewController {

      let channel = FlutterMethodChannel(
        name: CHANNEL,
        binaryMessenger: controller.binaryMessenger
      )

      channel.setMethodCallHandler { call, result in

        if call.method == "openPhoneDialer" {

          if let args = call.arguments as? [String: Any],
             let phone = args["phoneNumber"] as? String {

            if let url = URL(string: "tel:\(phone)") {
              UIApplication.shared.open(url)
            }

            result("success")

          } else {
            result("error")
          }

        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}