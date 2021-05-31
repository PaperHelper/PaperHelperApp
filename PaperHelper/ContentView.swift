//
//  ContentView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Your Interest").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.leading)
                        .frame(width: 380, height: 20)
                    
                }   //HStack
                
                List{
                    Text("Aritificial Intelligence")
                    Text("Networking and Internet Architecture")
                    Text("Computer Vision and Pattern")
                    
                }
            }.padding(.top, 30)
            
            
            
            VStack(spacing: 60){
                Text("Today's Paper").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).multilineTextAlignment(.leading)
                    .frame(width: 380, height: 20)
                
                Text("Conformer: Convolution-augmented Transformer for Speech Recognition")
                    .font(.system(size: 18, weight: .semibold))
                    .multilineTextAlignment(.center).lineLimit(1)
                    .padding()
                    .overlay( RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 4))
                    .frame(width: 380, height: 20)
                
                
                
                Text("MTH-IDS: A Multi-Tiered Hybrid Intrusion Detection System for Internet of Vehicles").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.center).lineLimit(1)
                    .padding()
                    .overlay( RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 4))
                    .frame(width: 380, height: 20)
                
                
                Text("Social-IWSTCNN: A Social Interaction-Weighted Spatio-Temporal Convolutional Neural Network for Pedestrian Trajectory Prediction in Urban Traffic Scenarios").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.center).lineLimit(1)
                    .padding()
                    .overlay( RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 4))
                    .frame(width: 380, height: 20)
                
                
            } // end of 2 VStack
            .padding(.bottom, 100)
        }//end of VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
