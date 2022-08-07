//
//  HelpView.swift
//  ValorantStoreChecker
//
//  Created by Gordon Ng on 2022-08-02.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        HStack{
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text(LocalizedStringKey("Help"))
                    .bold()
                    .font(.title3)
                
                Text(LocalizedStringKey("HelpMessage"))
                
                HStack{
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.trailing)
                    
                    Button {
                        if let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ") {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Text(LocalizedStringKey("Review"))
                            .bold()
                        
                        
                        Image(systemName: "link")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(.trailing)
                    }
                    
                }
                
                HStack{
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.trailing)
                    
                    Button {
                        if let url = URL(string: "https://github.com/sponsors/SoloUnity?frequency=one-time") {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        Text(LocalizedStringKey("Sponsor"))
                            .bold()
                        
                        Image(systemName: "link")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(.trailing)
                    }
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding()
        .foregroundColor(.white)
        .background(Blur(radius: 25, opaque: true))
        .cornerRadius(10)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 3)
                .offset(y: -1)
                .offset(x: -1)
                .blendMode(.overlay)
                .blur(radius: 0)
                .mask {
                    RoundedRectangle(cornerRadius: 10)
                }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
