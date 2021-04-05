//
//  AppleProvider.swift
//  
//
//  Created by Mateus Sousa on 29/12/20.
//

import Foundation
import AuthenticationServices

protocol AppleProviderDelegate {
    func didComplete(with error: Error)
    func didComplete(with auth: ASAuthorizationAppleIDCredential)
}

class AppleProvider: NSObject {
    
    var delegate: AppleProviderDelegate?
    
    func startFlowLogin() {
        let appleIdProvider = ASAuthorizationAppleIDProvider()
        let request = appleIdProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
}

extension AppleProvider: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        delegate?.didComplete(with: authorization.credential as! ASAuthorizationAppleIDCredential)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        delegate?.didComplete(with: error)
    }
}
