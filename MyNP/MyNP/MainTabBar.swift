//
//  MainTabBar.swift
//  MyNP
//
//  Created by Данила Кардашевский on 06.11.2022.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        VStack{
            TabView{
                
               HomeView()
                    .tabItem {
                        VStack{
                            Image(systemName: "house")
                            Text("Home")
                                .foregroundColor(.white)
                        }
                    }
                
                FavoriteView()
                     .tabItem {
                         VStack{
                             Image(systemName: "star.fill")
                             Text("Favorite")
                                 .foregroundColor(.white)
                             
                         }
                     }
                
                ProfileView()
                     .tabItem {
                         VStack{
                             Image(systemName: "person")
                             Text("Profile")
                                 .foregroundColor(.white)
                         }
                     }
                
                
            }
            

            
            
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("bg"))
            .ignoresSafeArea()
    }
    
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
