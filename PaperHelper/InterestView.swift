//
//  InterestView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct InterestView: View {
    @State var interestItems = ["Artificial Intelligence","Database", "Operating Systems", "Distributed, Parallel, and Cluster Computing", "Networking and Internet Architecture", "Computer Vision and Pattern Recognition", "Robotics", "Programming Languages", "Data Structures and Algorithms", "Cryptography and Security"]
    @State var alertIsVisible = false
    
    
    var body: some View {
        
        VStack{
            Text("Choose Your")
                .font(.title)
                .fontWeight(.bold).multilineTextAlignment(.leading)
                .fixedSize(horizontal: true, vertical: false)
            Text("Area of Interest!!")
                .font(.title)
                .fontWeight(.bold).multilineTextAlignment(.leading)
                .padding(.trailing, 3.024)
                .fixedSize(horizontal: true, vertical: false)
            
            List {
                ForEach(interestItems, id: \.self){
                    item in Text(item)
                    
                }//End of ForEach
            }//End of list
            .padding(.top, 20)
            
            
            Button(action: {
                self.alertIsVisible = true
                
            }) {
                Text("Save")
                    .foregroundColor(Color.white)
                    .frame(width: 380, height: 40)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .overlay( RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue, lineWidth: 2))
                    
            }
            //State for alert
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Saved Your change!"),
                      message: Text("We will recommand papers based on your interest."),
                      dismissButton: .default(Text("Okay")))
            }//end of .alert
            
        }
        .padding(.top, 30.0)
        .padding(.bottom, 30.0)
        
        
        
    }
}

struct InterestView_Previews: PreviewProvider {
    static var previews: some View {
        InterestView()
    }
}
