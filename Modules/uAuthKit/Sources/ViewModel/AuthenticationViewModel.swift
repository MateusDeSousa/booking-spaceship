//
//  AuthenticationViewModel.swift
//  
//
//  Created by Mateus Sousa on 06/01/21.
//

import Foundation
import AuthenticationServices

class AuthenticationViewModel: ObservableObject {
    
    private var appleProvider: AppleProvider?
    
    func requestSignIn() {
        appleProvider = AppleProvider()
        appleProvider?.delegate = self
        appleProvider?.startFlowLogin()
    }
}

extension AuthenticationViewModel: AppleProviderDelegate {
    
    func didComplete(with auth: ASAuthorizationAppleIDCredential) {
        let authManager = AuthManager()
        authManager.saveUser(auth)
        
    }
    
    func didComplete(with error: Error) {
        
    }
}

extension ASAuthorizationAppleIDCredential: UserAuth {
    
    public var userName: String? {
        self.fullName?.nickname
    }
    
    public var userEmail: String? {
        self.email
    }
}

public protocol UserAuth {
    var userName: String? { get }
    var userEmail: String? { get }
}
