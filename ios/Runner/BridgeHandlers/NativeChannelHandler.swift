import Flutter
import UIKit

class NativeChannelHandler {

    func handle(call: FlutterMethodCall, result: @escaping FlutterResult) {

        switch call.method {

        case "openPhoneDialer":
            PhoneDialerHandler.open(call: call, result: result)

        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

//
//  NativeChannelHandler.swift
//  Runner
//
//  Created by Alkaff M1 on 10/04/26.
//

