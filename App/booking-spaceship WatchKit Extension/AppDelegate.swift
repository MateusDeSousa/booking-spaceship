//
//  AppDelegate.swift
//  booking-spaceship WatchKit Extension
//
//  Created by Mateus Sousa on 26/12/20.
//

import Foundation
import SwiftUI
import uMapKit

@main
struct AppDelegate: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            MainView()
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
      }
}
