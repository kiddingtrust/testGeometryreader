//
//  ContentView.swift
//  MyNP
//
//  Created by Данила Кардашевский on 05.11.2022.
//

import SwiftUI

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var repeat_password = "" // repeat password for create new accaount
    @State private var about = false // localView(about)
    @State private var isAuth = true // authorization,registration
    @State private var eng = true //language
    @State private var isTabViewShow = false // open tab view
 
    var body: some View {
        //EN language
        if eng{
            VStack {
                Image("logo")
                    .padding(.bottom,50)
                
                
                Text(isAuth ? "Authorization" : "Registration")
                    .padding()
                    .font(.largeTitle.bold())
                    .cornerRadius(7)
                    .foregroundColor(.white)
                
                
                
                VStack (spacing: 40){
                    TextField("E-mail or Login", text: $email)
                        .padding()
                        .font(.title2.bold())
                        .background(Color("textfield"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(8)
                        .padding(.top,15)
                        .padding(.bottom,-50)
                    SecureField("Password", text: $password)
                        .padding()
                        .font(.title2.bold())
                        .background(Color("textfield"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(8)
                        .padding(.top,15)
                        .padding(.bottom,-20)
                    
                    if !isAuth{
                        SecureField("repeat Password", text: $repeat_password)
                            .padding()
                            .font(.title2.bold())
                            .background(Color("textfield"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding(8)
                            .padding(.top,-15)
                            .padding(.bottom,-20)
                    }
                    
                    Button {
                        if isAuth{
                            print("Авторизация пользователя через firebase")
                            isTabViewShow.toggle()
                        }
                        else
                        {
                            print("регистрация пользователя")
                            self.email = ""
                            self.password = ""
                            self.repeat_password = ""
                            isAuth.toggle() 
                        }
                        
                    } label: {
                        Text(isAuth ? "SIGN IN": "CREATE")
                            .padding()
                            .font(.largeTitle.bold())
                            .cornerRadius(7)
                            .foregroundColor(.white)
                    }
                    
                    
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Forgot password?")
                                .padding()
                                .background(Color("button"))
                                .cornerRadius(7)
                                .foregroundColor(.white)
                        }
                        
                        Button {
                            eng.toggle()
                        } label: {
                            Image(eng ? "languageEN" : "languageRU" )
                        }
                        
                        
                        Button {
                            isAuth.toggle()
                        } label: {
                            Text(isAuth ? "Create new account" : "Authorization")
                                .padding()
                                .background(Color("button"))
                                .cornerRadius(7)
                                .foregroundColor(.white)
                        }
                        
                    }
                }
                .background(Color("bg2"))
                .cornerRadius(isAuth ? 0:13)
                .padding(isAuth ? 0 : 10)
                
                
                
                Button {
                    self.about.toggle()
                } label: {
                    Text("About us")
                        .padding()
                        .background(Color("button"))
                        .foregroundColor(.white)
                        .cornerRadius(7)
                    
                }
                .sheet(isPresented: $about){
                    aboutus()
                }
                
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color("bg")
                .ignoresSafeArea()
                .blur(radius: isAuth ? 0 : 7)  )
            .animation(Animation.easeOut(duration: 0.3), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                MainTabBar()
            }
               
        }
 
        //RU language
        else{
            VStack{
                Image("logo")
                    .padding(.bottom,50)
                
                
                Text(isAuth ? "Авторизация" : "Регистрация")
                    .padding()
                    .font(.largeTitle.bold())
                    .cornerRadius(7)
                    .foregroundColor(.white)
                
                
                
                VStack (spacing: 40){
                    TextField("Почта или логин", text: $email)
                        .padding()
                        .font(.title2.bold())
                        .background(Color("textfield"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(8)
                        .padding(.top,15)
                        .padding(.bottom,-50)
                    SecureField("Пароль", text: $password)
                        .padding()
                        .font(.title2.bold())
                        .background(Color("textfield"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(8)
                        .padding(.top,15)
                        .padding(.bottom,-20)
                    
                    if !isAuth{
                        SecureField("Повторите пароль", text: $repeat_password)
                            .padding()
                            .font(.title2.bold())
                            .background(Color("textfield"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding(8)
                            .padding(.top,-15)
                            .padding(.bottom,-20)
                    }
                    
                    Button {
                        
                    } label: {
                        Text(isAuth ? "ВХОД" : "Зарегистрироваться")
                            .padding()
                            .font(.largeTitle.bold())
                            .cornerRadius(7)
                            .foregroundColor(.white)
                    }
                    
                    
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Забыли пароль?")
                                .padding()
                                .background(Color("button"))
                                .cornerRadius(7)
                                .foregroundColor(.white)
                        }
                        
                        Button {
                            eng.toggle()
                        } label: {
                            Image(eng ? "languageEN" : "languageRU" )
                        }
                        
                        
                        Button {
                            isAuth.toggle()
                        } label: {
                            Text(isAuth ? "Создать новый аккаунт" : "Авторизация")
                                .padding()
                                .background(Color("button"))
                                .cornerRadius(7)
                                .foregroundColor(.white)
                        }
                        
                    }
                }
                .background(Color("bg2"))
                .cornerRadius(isAuth ? 0:13)
                .padding(isAuth ? 0 : 10)
                
                
                
                Button {
                    self.about.toggle()
                } label: {
                    Text("О нас")
                        .padding()
                        .background(Color("button"))
                        .foregroundColor(.white)
                        .cornerRadius(7)
                    
                }
                .sheet(isPresented: $about){
                    aboutus()
                }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(Color("bg")
                .ignoresSafeArea()
                .blur(radius: isAuth ? 0 : 7))
            .animation(Animation.easeOut(duration: 0.3), value: isAuth)
        }
            
    }
}




struct aboutus: View{
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Text("ABOUT US")
                .padding(.top,40)
                .font(.largeTitle.bold())
                .cornerRadius(7)
                .foregroundColor(.white)
     
            ScrollView{
                VStack{
                    Image("logo")
                    Text("World Cryptomachine is not only a company, but also a large team.\n\nThe founder of which is -Kardashevsky Danila Igorevich.\n\nThe goal of this project is to provide the most correct values for coins from the world of cryptocurrencies. \n\nDue to the logic of the program and partners, we have the opportunity to have such data and provide it to you\n\nP.s with love World Cryptomachine:)")
                        .padding(.top,40)
                        .font(.title)
                        .cornerRadius(7)
                        .foregroundColor(.white)
                    
                    
                }
                
            }
            
            
            
            
            Button {
                 self.presentationMode.wrappedValue.dismiss()
             } label: {
                 Text("Back")
                     .padding()
                     .background(Color("textfield"))
                     .cornerRadius(3)
                     .foregroundColor(.white)
                     .padding(.bottom,30)
             }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color("bg"))
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
