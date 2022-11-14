//
//  FavoriteView.swift
//  MyNP
//
//  Created by Данила Кардашевский on 06.11.2022.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        VStack{
            Text("Избранное")
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("bg"))
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
