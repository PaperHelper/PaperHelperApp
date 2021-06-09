//
//  InterestView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct InterestlistItem: Identifiable {    //unique한 이름이 필요함
    let id = UUID()     //unidue한 id
    var name: String
    var isChecked: Bool = false
}

struct InterestView: View {
    @State var interestlistItems = [
        InterestlistItem(name : "Artificial Intelligence", isChecked: false),
        InterestlistItem(name :"Database", isChecked: false),
        InterestlistItem(name :"Operating Systems", isChecked: false),
        InterestlistItem(name :"Distributed, Parallel, and Cluster Computing", isChecked: false),
        InterestlistItem(name :"Networking and Internet Architecture", isChecked: false),
        InterestlistItem(name :"Computer Vision and Pattern Recognition", isChecked: false),
        InterestlistItem(name :"Robotics", isChecked: false),
        InterestlistItem(name :"Programming Languages", isChecked: false),
        InterestlistItem(name :"Data Structures and Algorithms", isChecked: false),
        InterestlistItem(name :"Computation and Language", isChecked: false),
    ]
    
    @State var alertIsVisible = false
    @State var interestFlag : Bool = true
    @State var interestData : Data?
    @State var interestString : String = ""
    @State var interestArr = [String]()
    
    
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
                ForEach(interestlistItems){
                    interestlistItem in
                    HStack{
                        Text(interestlistItem.name)
                        Spacer()
                        Text(interestlistItem.isChecked ? "✓" : " ")
                            .font(.title)
                            .foregroundColor(Color.blue)
                            .bold()
                            
                    } // end of HStack
                    .background(Color.white)    //그 줄의 어딜 눌러도 clickable
                    .onTapGesture {
                        if let matchingIndex = self.interestlistItems.firstIndex(where: {
                            $0.id == interestlistItem.id
                        }){
                            self.interestlistItems[matchingIndex].isChecked.toggle()
                        }
                    }
                } //End of ForEach
            }//End of list
            .padding(.top, 20)
            
            
            Button(action: {
                self.alertIsVisible = true
                
                let fileManager = FileManager.default
                let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                let directoryURL = documentsURL.appendingPathComponent("DoNotDelete")
                
                do {
                    // 폴더 생성
                    try fileManager.createDirectory(atPath: directoryURL.path, withIntermediateDirectories: false, attributes: nil)
                } catch let e {
                    // 오류 처리
                    print(e.localizedDescription)
                }
                
                // 저장할 파일 이름 (확장자 필수)
                let interestPath = directoryURL.appendingPathComponent("PaperInterest.txt")
                // 파일에 들어갈 string
                var text = ""
                for item in interestlistItems{
                    
                    if item.isChecked == true {
                        text.append(item.name)
                        text.append("\n")
                    }
                    
                }
                
                
                do {
                    // 4-1. 파일 생성
                    try text.write(to: interestPath, atomically: false, encoding: .utf8)
                }catch let error as NSError {
                    print("Error creating File : \(error.localizedDescription)")
                }
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
        .onAppear(){
            let fileManager = FileManager.default
            let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let directoryURL = documentsURL.appendingPathComponent("DoNotDelete")
            let interestPath = directoryURL.appendingPathComponent("PaperInterest.txt")
            
            if !fileManager.fileExists(atPath: interestPath.path) {
                interestFlag = false
            }
            if interestFlag == true{
                interestData = fileManager.contents(atPath : interestPath.path)!
                interestString = String(data: interestData!, encoding: .utf8)!
                print(interestString)
                interestArr = interestString.components(separatedBy: "\n")
                if interestArr.count > 0 {
                    interestArr.removeLast()
                }
            }
            for item in interestArr {
                for i in 0..<interestlistItems.count{
                    if item == interestlistItems[i].name {
                        interestlistItems[i].isChecked = true
                    }
                } //end of for interestlistItem
            } //end of for Arr

        } // end of onAppear
    }
}

struct InterestView_Previews: PreviewProvider {
    static var previews: some View {
        InterestView()
    }
}
