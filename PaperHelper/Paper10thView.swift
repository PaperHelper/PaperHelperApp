//
//  Paper1stView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct Paper10thView: View {
    
    @State var alertIsVisible2 = false
    @State var paperDict: Dictionary <String, String> = [:]
    
    var body: some View {
        VStack{
            
            Text(paperDict["title9"] ?? "")
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
                    Text(paperDict["author9"] ?? "")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Author HStack
                Spacer();
                HStack{
                    Text("Publication")
                        .font(.system(size: 15))
                        .frame(width: 80, height: 25)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.3))
                    Text(paperDict["publication9"] ?? "")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Publication HStack
                
                Spacer();
                HStack{
                    Text("Year")
                        .font(.system(size: 15))
                        .frame(width: 80, height: 25)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.3))
                    Text(paperDict["year9"] ?? "")
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
                Text(paperDict["summary9"] ?? "")
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
        .onAppear(){
            
            requestGet()
        }
    }//end of VStack
    
    
    
    func requestGet() {
        //URL생성
        guard let url = URL(string: "http://163.239.28.25:5000/paper") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "get" //get : Get 방식, post : Post 방식
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            //error 일경우 종료
            guard error == nil && data != nil else {
                if let err = error {
                    print(err.localizedDescription)
                }
                return
            }
         
            if let _data = data {
                
                
                let jsonString:String = String.init(data: _data, encoding: .utf8) ?? "err"
                //print(jsonString)
                
                do{
                    //decode is not working properly
                    let newData = Data(jsonString.utf8)
                    //print(newData)
                    var jsonDerived = try JSONDecoder().decode(PaperGet.self, from : _data)
                    //print(jsonDerived.title0)
                    
                    var i = 0
                    paperDict["title\(i)"] = jsonDerived.title0
                    paperDict["author\(i)"] = jsonDerived.author0
                    paperDict["publication\(i)"] = jsonDerived.publication0
                    paperDict["year\(i)"] = jsonDerived.year0
                    paperDict["summary\(i)"] = jsonDerived.summary0
                    paperDict["pdf\(i)"] = jsonDerived.pdf0
                    i = 1
                    paperDict["title\(i)"] = jsonDerived.title1
                    paperDict["author\(i)"] = jsonDerived.author1
                    paperDict["publication\(i)"] = jsonDerived.publication1
                    paperDict["year\(i)"] = jsonDerived.year1
                    paperDict["summary\(i)"] = jsonDerived.summary1
                    paperDict["pdf\(i)"] = jsonDerived.pdf1
                    i = 2
                    paperDict["title\(i)"] = jsonDerived.title2
                    paperDict["author\(i)"] = jsonDerived.author2
                    paperDict["publication\(i)"] = jsonDerived.publication2
                    paperDict["year\(i)"] = jsonDerived.year2
                    paperDict["summary\(i)"] = jsonDerived.summary2
                    paperDict["pdf\(i)"] = jsonDerived.pdf2
                    
                                            
                } catch let jsonErr {
                    print("Error seriallizing json:",jsonErr)
                }
                
            }else{
                print("data nil")
            }
        })
        task.resume()
        
    }
    
}

struct Paper10thView_Previews: PreviewProvider {
    static var previews: some View {
        Paper1stView()
    }
}
