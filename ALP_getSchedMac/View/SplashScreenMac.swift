//
//  SplashScreenMac.swift
//  ALP_getSchedMac
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

struct SplashScreenMac: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive{
               // HomeView()
            } else {
                Rectangle()
                    .fill(Color.blue)
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

struct SplashScreenMac_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenMac()
    }
}
