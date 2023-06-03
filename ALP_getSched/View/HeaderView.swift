//
//  HeaderView.swift
//  ALP_getSched
//
//  Created by MacBook Pro on 02/06/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: 15))
               
            
            VStack{
                Text("GETSCHED")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text("Stream Line Your Task")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3
               ,height: 300)
        .offset(y: -100)
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
