//
//  MainView.swift
//  
//
//  Created by Mateus Sousa on 26/12/20.
//

import SwiftUI
import MapKit
import uCore

public struct MainView: View {
    
    @ObservedObject var viewModel = MapViewModel()
    
    public init() { }
    
    public var body: some View {
        ZStack() {
            MapView()
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                    AvatarView()
                    Spacer()
                    MapButtons {
                        viewModel.goUserLocation()
                    }
                }
            }
        }.onAppear() {
            viewModel.requestAuthorization()
        }.ignoresSafeArea()
    }
    
    private func MapView() -> some View {
        Map(coordinateRegion: Binding<MKCoordinateRegion>.constant(viewModel.location), showsUserLocation: true)
    }
    
    private func AvatarView() -> some View {
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
    
    private func MapButtons(actionCentralize: (() -> Void)?) -> some View {
        Button(action: {
            actionCentralize?()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
