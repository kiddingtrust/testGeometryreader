//
//  CardView.swift
//  MyNP
//
//  Created by Данила Кардашевский on 06.11.2022.
//

import SwiftUI

struct CardView: View {
    
    var colors:[Color]
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Text("Solana")
                    .font(.system(size:19,weight: .semibold,design: .default))
                    .foregroundColor(.accentColor)
                Spacer()
                HStack{
                    Text("256 SOL(8.266$)")
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    Image("solana")
              
                }
            
            }
            .padding()
        }
        .frame(width: 242,height: 153)
        .background(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
        .cornerRadius(15)
        .shadow(color: . accentColor.opacity(0.2),radius: 5,x: 4 ,y: 4)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(colors: [Color("lightBlue"),Color ("lightIndigo" )])
    }
}
