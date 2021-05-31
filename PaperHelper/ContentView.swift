//
//  ContentView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Your Interest")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 250, height: 50)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Spacer();
                    Spacer();
                    Spacer();
                    
                    NavigationLink(destination: InterestView()){
                        
                        Text("Edit")
                            .foregroundColor(Color.blue)
                            .modifier(ButtonLargeTextStyle())
                            .fixedSize(horizontal: true, vertical: false)
                        
                        
                    }
                    
                    
                }   //HStack
                .padding(.top, 40)
                .padding([.leading,.trailing], 80)
                
                VStack{
                    List{
                        Text("Aritificial Intelligence")
                        Text("Networking and Internet Architecture")
                        Text("Computer Vision and Pattern")
                        
                    }
                }
                
                
                HStack{
                    Text("Today's Paper")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 250, height: 50).multilineTextAlignment(.leading)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Spacer();
                    Spacer();
                    Spacer();
                    
                    NavigationLink(destination: MoreView()){
                        
                        Text("View More")
                            .foregroundColor(Color.blue)
                            .modifier(ButtonSmallTextStyle())
                            .fixedSize(horizontal: true, vertical: false)
                        
                        
                    }
                    
                    
                    
                }   //HStack
                .padding(.bottom, 40)
                .padding([.leading,.trailing], 80)
                
                VStack(spacing: 20){
                    
                    Text("Conformer: Convolution-augmented Transformer for Speech Recognition")
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center).lineLimit(1)
                        .frame(width: 370, height: 60)
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2))
                    
                    
                    
                    
                    Text("MTH-IDS: A Multi-Tiered Hybrid Intrusion Detection System for Internet of Vehicles").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.center).lineLimit(1)
                        .frame(width: 370, height: 60)
                        
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2))
                    
                    
                    
                    Text("Social-IWSTCNN: A Social Interaction-Weighted Spatio-Temporal Convolutional Neural Network for Pedestrian Trajectory Prediction in Urban Traffic Scenarios").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.center).lineLimit(1)
                        .frame(width: 370, height: 60)
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2))
                    
                    
                    
                } // end of 2 VStack
                .padding(.bottom, 100)
            }//end of VStack
            .navigationBarTitle("Paper Helper", displayMode: .inline)
        }//nevigationview
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ButtonLargeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Round MT Bold", size: 16))
            .foregroundColor(Color.black)
        
        
        
    }
}

//For the Start over and Info button
struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Round MT Bold", size: 12))
            .foregroundColor(Color.black)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
