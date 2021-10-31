//
//  AppDelegate.swift
//  PopcornAdventure
//
//  Created by EasyPOS iOS Dev on 10/30/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// Set up root view controller for easy tracing. Call this function in `didFinishLaunchingWithOptions` for reusability.
    private func setupRootViewController(of window: UIWindow?) {
        Thread.sleep(forTimeInterval: 2.0)
        window?.rootViewController = ListViewController()
        window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        setupRootViewController(of: window)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    /// Call `setDateLastSeen()` from `Utilities` to save the date and time the user last used the application.
    func applicationWillTerminate(_ application: UIApplication) {
        Utilities().setDateLastSeen()
    }

}

