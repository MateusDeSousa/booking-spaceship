//
//  MapButtons.swift
//  
//
//  Created by Mateus Sousa on 26/12/20.
//

import SwiftUI

struct MapButtons: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Image("icon-current-position", bundle: .module)
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                }
                .background(Color.orangeColor)
                .frame(width: 35, height: 35, alignment: .center)
                .clipShape(Circle())
                .padding()
            }
        }
    }
}
