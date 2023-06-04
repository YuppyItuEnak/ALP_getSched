//
//  SplashScreen.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive{
                HomeView()
            }else{
                Rectangle()
                    .background(Color.blue)
                Image("AppIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
