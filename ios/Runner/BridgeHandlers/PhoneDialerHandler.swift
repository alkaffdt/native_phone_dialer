import Flutter
import UIKit

class PhoneDialerHandler {

    static func open(call: FlutterMethodCall, result: @escaping FlutterResult) {

        guard let args = call.arguments as? [String: Any],
              let phone = args["phoneNumber"] as? String,
              let url = URL(string: "tel:\(phone)") else {

            result("error")
            return
        }

        UIApplication.shared.open(url)

        result("success")
    }
}

//
//  PhoneDialerHandler.swift
//  Runner
//
//  Created by Alkaff M1 on 10/04/26.
//

