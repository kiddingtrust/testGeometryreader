//
//  ProfileView.swift
//  MyNP
//
//  Created by Данила Кардашевский on 06.11.2022.
//

import SwiftUI

struct ProfileView: View {

    @State private var isAuthView = false // open tab view
    @State private var isSettingsView = false // open tab view
    @State private var isCommynityView = false // open tab view
    @State private var isAboutView = false // open tab view
    
    var body: some View {
        VStack{
            //HEADER
            //name and logo
            Profile()
            
            //scrollView for card
            ScrollView(.horizontal, showsIndicators:false){
                HStack(spacing: 0){
                    ForEach(CardModel.colors){colors in
                        VStack{
                            GeometryReader{ geo in
                                CardView(colors: colors.colors)
                                    .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX / 15)), axis: (x :0 , y: 1 , z: 0))
                            }
                            .frame(width:250,height: 190)
                        }
                    }
                }

              
            }
            //BODY
            ScrollView(.vertical,showsIndicators: false){
                //settings
                Button {
                    isSettingsView.toggle()
     
                } label: {
                    
                    Text("Settings")
                        .padding(.horizontal,100)
                        .padding(.vertical,10)
                        .font(.largeTitle.bold())
                        .foregroundColor(.accentColor)
                        .background(Color("button"))
                        .cornerRadius(7)
                }
                .fullScreenCover(isPresented: $isSettingsView) {
                    SettingsView()
                    
                }
                
                //Community
                Button {
                    isSettingsView.toggle()
                } label: {
                    Text("Community")
                        .padding(.horizontal,74)
                        .padding(.vertical,10)
                        .font(.largeTitle.bold())
                        .foregroundColor(.accentColor)
                        .background(Color("button"))
                        .cornerRadius(7)
                }
                .fullScreenCover(isPresented: $isCommynityView) {
                    CommunityView()
                    
                }
                
                //about
                Button {
                    isAboutView.toggle()
                } label: {
                    Text("About")
                        .padding(.horizontal,120)
                        .padding(.vertical,10)
                        .font(.largeTitle.bold())
                        .foregroundColor(.accentColor)
                        .background(Color("button"))
                        .cornerRadius(7)
                }
                .fullScreenCover(isPresented: $isAboutView) {
                    AboutView()
                    
                }
                
            //exit button
            Button {
                isAuthView.toggle()
            } label: {
                Text("Выход из аккаунта")
                    .padding(.horizontal,48)
                    .padding(.vertical,10)
                    .font(.title)
                    .lineLimit(1)
                    .foregroundColor(.red)
                    .background(Color("button"))
                    .cornerRadius(7)
            }
            .fullScreenCover(isPresented: $isAuthView) {
                AuthView()
        }
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("bg"))

    }
        
    
    //function for frame name and logo.profile
@ViewBuilder
    private func Profile() -> some View {
        HStack{
            Text("Welcome back, \n  Patched")
                .font(.system(size: 22,weight: .bold ,design: .default))
                .foregroundColor(.accentColor)
            Spacer()
            ZStack{
                Circle()
                    .foregroundColor(.gray)
                    .padding(.leading,170)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.leading,170)
            }
            .frame(width: 55,height: 55)
            Spacer()
            
        }
        .padding([.trailing,.leading])
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
