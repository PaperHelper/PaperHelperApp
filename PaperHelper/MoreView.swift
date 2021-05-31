//
//  MoreView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        
        VStack{
            Text("Today’s")
                .font(.title)
                .fontWeight(.bold).multilineTextAlignment(.leading)
                .fixedSize(horizontal: true, vertical: false)
            Text("Recommended Paper")
                .font(.title)
                .fontWeight(.bold).multilineTextAlignment(.leading)
                .padding(.trailing, 3.024)
                .fixedSize(horizontal: true, vertical: false)
            List{
                NavigationLink(destination: Paper1stView()){
                    VStack{
                        
                        Text("Conformer: Convolution-augmented Transformer for Speech Recognition")
                            .font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        Text("Recurrent neural networks have been the defacto choice for ASR. While Transformers are good at modeling long-range global context, they are less capable to extract ﬁnegrained local feature patterns. In this work, we study how to organically combine convolutions with self-attention in ASR models.")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                        
                        
                    }//논문1 VStack
                }//논문1 Navigation
                
                NavigationLink(destination: Paper2ndView()){
                    VStack{
                        Text("MTH-IDS: A Multi-Tiered Hybrid Intrusion Detection System for Internet of Vehicles").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        
                        Text("Cyber threats may decrease the stability and robustness of IoV, as well as cause vehicle unavailability or trafﬁc accidents. Machine learning and data mining algorithms have been recognized as effective models to design IDSs. A multi-tiered hybrid intrusion detection system is proposed to identify known and zero-day cyber-attacks on both intra-vehicle and external networks.")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문2 VStack
                }//논문2 Navigation
                
                
                NavigationLink(destination: Paper3rdView()){
                    VStack{
                        Text("Social-IWSTCNN: A Social Interaction-Weighted Spatio-Temporal Convolutional Neural Network for Pedestrian Trajectory Prediction in Urban Traffic Scenarios").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        Text("We train and evaluate our algorithm on Waymo Open Dataset because it contains more sufﬁcient urban trafﬁc scenarios than the previously used ETH and UCY datasets. The pedestrians are labeled by 3D bounding boxes on LiDAR data with their real-world center position and size. We use MLP to learn the social interaction weights, and use an aggregate function to extract the spatial and social interaction features.")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문3 VStack
                }//논문3 Navigation
            }
            
            
        }//end of VStack
        .padding(.top, 30.0)
        .padding(.bottom, 30.0)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
