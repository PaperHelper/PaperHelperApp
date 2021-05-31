//
//  Paper1stView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct Paper1stView: View {
    
    @State var alertIsVisible2 = false
    
    var body: some View {
        VStack{
            
            Text("Conformer: Convolution-augmented Transformer for Speech Recognition")
                .font(.system(size: 20, weight: .semibold))
                .multilineTextAlignment(.center).lineLimit(nil)
                .frame(width: 350, height: 60)
            Spacer();
            Group{
                HStack{
                    Text("Author")
                        .font(.system(size: 15))
                        .frame(width: 80, height: 25)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.3))
                    Text("Anmol Gulati, et al.")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Author HStack
                Spacer();
                HStack{
                    Text("Publication")
                        .font(.system(size: 15))
                        .frame(width: 80, height: 25)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.3))
                    Text("Submitted to Interspeech 2020")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Publication HStack
                
                Spacer();
                HStack{
                    Text("Year")
                        .font(.system(size: 15))
                        .frame(width: 80, height: 25)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.3))
                    Text("2020")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Year HStack
            } // end of Group
            
            Spacer();
            
            HStack{
                Text("Summary")
                    .font(.system(size: 15))
                    .frame(width: 80, height: 25)
                    .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.3))
                Text("  ")
                    .font(.system(size: 15))
                    .frame(width: 270, height: 25)
            }//end of Year HStack
            
            ScrollView(.vertical, showsIndicators: false) {
                Text("""
            Recurrent neural networks have been the defacto choice for ASR. While Transformers are good at modeling long-range global context, they are less capable to extract ﬁnegrained local feature patterns. In this work, we study how to organically combine convolutions with self-attention in ASR models.
            The proposed Conformer block contains two Feed Forward modules sandwiching the Multi-Headed Self-Attention module and the Convolution module. We found that convolution module stacked after the self-attention module works best for speech recognition. We evaluate the proposed model on the LibriSpeech dataset, which consists of 970 hours of labeled speech and an additional 800M word token text-only corpus.
            A Conformer block differs from a Transformer block in a number of ways, in particular, the inclusion of a convolution block and having a pair of FFNs surrounding the block in the Macaron-style. Using swish activations led to faster convergence in the Conformer models. Increasing attention heads up to 16 improved the accuracy of the devother datasets.
            
            
            """)
                    .font(.system(size: 15))
                    .frame(width: 350)
            } //end of Summary Scroll
            
            
            Button(action: {
                self.alertIsVisible2 = true
                
            }) {
                Text("Download PDF")
                    .foregroundColor(Color.white)
                    .frame(width: 380, height: 40)
                    .overlay( RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue, lineWidth: 2))
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            //State for alert
            .alert(isPresented: self.$alertIsVisible2) {
                Alert(title: Text("Downloaded This Paper PDF!"),
                      message: Text("You can read whole paper now."),
                      dismissButton: .default(Text("Okay")))
            }//end of .alert
            
        }
        .padding(.top, 30.0)
        .padding(.bottom, 30.0)
        
    }//end of VStack
    
}

struct Paper1stView_Previews: PreviewProvider {
    static var previews: some View {
        Paper1stView()
    }
}
