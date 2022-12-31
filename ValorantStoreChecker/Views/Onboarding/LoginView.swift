//
//  LoginView.swift
//  ValorantStoreChecker
//
//  Created by Gordon Ng on 2022-07-15.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var authAPIModel : AuthAPIModel
    @EnvironmentObject private var skinModel : SkinModel
    @EnvironmentObject private var alertModel : AlertModel
    @EnvironmentObject private var networkModel : NetworkModel
    @State private var regionCheck : Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .top) {
                Logo()
                    .frame(height: 70)
                
                VStack() {

                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        
                        Text("Sign in")
                            .font(.title)
                            .bold()
                            .padding(.top, 5)
                        
                        LoginInfoView()
                        
                        VStack {
                            LoginBoxView()
                                
                            ThirdPartyView()
                        }
                        .padding(.vertical)
                        
                        
                        RegionSelectorView(regionCheck: $regionCheck)
                        
                        Divider()
                        
                        // MARK: Terms and Conditions
                        NavigationLink {
                            TermsView()
                        } label: {
                            HStack {
                                
                                // LOCALIZETEXT
                                Text("By clicking on ").foregroundColor(.white) + Text("Sign in").foregroundColor(.white).italic() + Text(", you agree to our").foregroundColor(.white) + Text(" Terms and Conditions ").foregroundColor(.gray).bold() + Text("and to our ").foregroundColor(.white) + Text("[Privacy Policy](https://www.craft.do/s/fQxdg6aSyp8WAk)").bold()

                                Spacer()
                            }
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        }
                        
                        
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .padding()
                    .offset(y: -30)
                    
                    Spacer()
                    

                    // MARK: Log in button
                    if regionCheck {
                        
                        
                        Button {
                            
                            
                            if networkModel.isConnected {
                                
                                // Dismiss keyboard
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                
                                DispatchQueue.main.async {
                                    
                                    authAPIModel.isAuthenticating = true // Start loading animation
                                    
                                }
                                
                                Task{
                                    await authAPIModel.login(skinModel: skinModel)
                                }
                                
                            }
                            else {
                                
                                withAnimation(.easeIn) {
                                    alertModel.alertNoNetwork = true
                                }
                                
                            }
                            
                            
                            
                        } label: {
                            
                            if !authAPIModel.isAuthenticating {
                                
                                ZStack{
                                    RectangleView()
                                        .shadow(color:.pink, radius: 2)
                                        .cornerRadius(15)
                                    
                                    Text("Sign in")
                                        .bold()
                                        .padding(15)
                                        .foregroundColor(.white)
                                    
                                    
                                }
                                .padding(.horizontal)
                                .frame(height: Constants.dimensions.circleButtonSize)
                            }
                            else{
                                
                                ZStack{
                                    RectangleView()
                                        .shadow(color:.pink, radius: 2)
                                        .cornerRadius(15)
                                    
                                    ProgressView()
                                        .tint(.gray)
                                    
                                    
                                }
                                .padding(.horizontal)
                                .frame(height: Constants.dimensions.circleButtonSize)

                            }
                            
                            
                        }
                        
                    }
                    else {
                        
                        ZStack{
                            RectangleView()
                                .cornerRadius(15)
                                .preferredColorScheme(.dark)
                            
                            Text("Sign in")
                                .bold()
                                .padding(15)
                                .foregroundColor(.white)
                                
                        }
                        .padding(.horizontal)
                        .frame(height: Constants.dimensions.circleButtonSize)
                        
                    }
                }
            }
            .background(Constants.bgGrey)
            .preferredColorScheme(.dark)
        }
        
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
