//
//  ChatApp.swift
//  Chat
//
//  Created by Vladimir Fibe on 17.02.2022.
//

import SwiftUI
import Firebase
import UserNotifications
import FirebaseMessaging

@main
struct ChatApp: App {

  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  var body: some Scene {
    WindowGroup {
      AuthOrMainView()
        .environmentObject(AuthViewModel.shared)
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate { // UIResponder
  let gcmMessageIDKey = "gcm.message_id"
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    Messaging.messaging().delegate = self
    for family in UIFont.familyNames.sorted() {
      let names = UIFont.fontNames(forFamilyName: family)
      print(family, names)
    }

    if #available(iOS 10.0, *) {
      // For iOS 10 display notification (sent via APNS)
      UNUserNotificationCenter.current().delegate = self

      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: { _, _ in }
      )
    } else {
      let settings: UIUserNotificationSettings =
        UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }

    application.registerForRemoteNotifications()

    return true
  }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    completionHandler([[.banner, .sound]])
  }
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    
    print(userInfo)
    
    completionHandler()
  }
}

extension AppDelegate: MessagingDelegate {
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    let deviceToken: [String: String] = ["token": fcmToken ?? ""]
    print("Device token: ", deviceToken)
  }
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }
}
