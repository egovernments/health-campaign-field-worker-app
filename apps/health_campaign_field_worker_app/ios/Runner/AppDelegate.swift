import UIKit
import Flutter
import UserNotifications
import flutter_background_service_ios 

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
 override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    UNUserNotificationCenter.current().delegate = self
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
        application.applicationIconBadgeNumber = 0 // For Clear Badge Counts
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications() // To remove all delivered notifications
        center.removeAllPendingNotificationRequests()
    }
    application.registerForRemoteNotifications()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
