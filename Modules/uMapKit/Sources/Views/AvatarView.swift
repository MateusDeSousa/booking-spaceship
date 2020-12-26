//
//  AvatarView.swift
//  
//
//  Created by Mateus Sousa on 26/12/20.
//

import SwiftUI

struct AvatarView: View {
    
    public var body: some View {
        HStack {
            VStack() {
                Spacer()
                Button(action: {
                    
                }) {
                    Image("avatar", bundle: .module)
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                }
                .clipShape(Circle(), style: FillStyle())
                .frame(width: 35, height: 35, alignment: .center)
                .shadow(radius: 10)
                .padding()
            }
            Spacer()
        }
    }
}
