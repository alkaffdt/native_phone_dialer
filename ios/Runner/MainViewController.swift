import UIKit
import Flutter

class MainViewController: FlutterViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let channel = FlutterMethodChannel(
            name: "com.example/native",
            binaryMessenger: self.binaryMessenger
        )

        channel.setMethodCallHandler { (call, result) in
            
            if call.method == "openPhoneDialer" {
                
                if let number = call.arguments as? String {
                    if let url = URL(string: "tel://\(number)") {
                        UIApplication.shared.open(url)
                    }

                    
                }
                
                // result("success")

            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
