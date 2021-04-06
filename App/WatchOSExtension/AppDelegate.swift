//
//  AppDelegate.swift
//  booking-spaceship WatchKit Extension
//
//  Created by Mateus Sousa on 26/12/20.
//

import SwiftUI
import uMapKit
import uAuthKit
import uCore

@main
struct AppDelegate: App {
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            getScene()
        }
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
    
    @ViewBuilder
    private func getScene() -> some View {
        let authManager = AuthManager()
        if authManager.isLogged() {
            MainView()
        }else {
            AuthenticationView()
        }
    }
}


