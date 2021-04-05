//
//  AuthenticationView.swift
//  
//
//  Created by Mateus Sousa on 06/01/21.
//

import SwiftUI

public struct AuthenticationView: View {
    
    public init() { }
    
    @ObservedObject var viewModel = AuthenticationViewModel()
    
    public var body: some View {
        VStack {
            LoginText()
                .padding(.top)
            Spacer()
            AppleProviderButton()
                .padding(.bottom)
        }
    }
    
    private func LoginText() -> some View {
        Text("intruction_login", bundle: .module)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
            
    }
    
    private func AppleProviderButton() -> some View {
        VStack{
            Button(action: {
                viewModel.requestSignIn()
            }, label: {
                HStack {
                    Image("iconProviderApple", bundle: .module)
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .scaledToFit()
                        .frame(width: 20 , height: 20, alignment: .center)
                    Text("Sign with Apple")
                        .foregroundColor(.black)
                }
            })
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
