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
        
    }
    
    func didComplete(with error: Error) {
        
    }
}
