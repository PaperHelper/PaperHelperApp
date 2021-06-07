//
//  MoreView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct MoreView: View {
    
    @State var paperDict: Dictionary <String, String> = [:]
    
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
                        
                        Text(paperDict["title0"] ?? "")
                            .font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        Text(paperDict["summary0"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                        
                        
                    }//논문1 VStack
                }//논문1 Navigation
                
                NavigationLink(destination: Paper2ndView()){
                    VStack{
                        Text(paperDict["title1"] ?? "").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        
                        Text(paperDict["summary1"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문2 VStack
                }//논문2 Navigation
                
                
                NavigationLink(destination: Paper3rdView()){
                    VStack{
                        Text(paperDict["title2"] ?? "").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        Text(paperDict["summary2"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문3 VStack
                }//논문3 Navigation
            }
            
            
        }//end of VStack
        .padding(.top, 30.0)
        .padding(.bottom, 30.0)
        .onAppear(){
            
            requestGet()
        }
    }
    
    
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
                    var jsonDerived = try JSONDecoder().decode(String.self, from : _data)
                    //print(jsonDerived)
                    jsonDerived = jsonDerived.replacingOccurrences(of: "{", with: "")
                    jsonDerived = jsonDerived.replacingOccurrences(of: "}", with: "")
                    jsonDerived = jsonDerived.replacingOccurrences(of: "\"", with: "")
                    var arr =  jsonDerived.components(separatedBy: ", ")
                    //arr =  jsonDerived.components(separatedBy: ":")
                    //print(arr)
                    for var item in arr {
                        for i in 0..<3 {
                            if item.contains("title\(i)") {
                                item = item.replacingOccurrences(of: "title\(i): ", with: "")
                                paperDict["title\(i)"] = item
                                
                            }
                            else if item.contains("author\(i)") {
                                item = item.replacingOccurrences(of: "author\(i): ", with: "")
                                paperDict["author\(i)"] = item
                                
                            }
                            else if item.contains("publication\(i)") {
                                item = item.replacingOccurrences(of: "publication\(i): ", with: "")
                                paperDict["publication\(i)"] = item
                                
                            }
                            else if item.contains("year\(i)") {
                                item = item.replacingOccurrences(of: "year\(i): ", with: "")
                                paperDict["year\(i)"] = item
                                
                            }
                            else if item.contains("summary\(i)") {
                                item = item.replacingOccurrences(of: "summary\(i): ", with: "")
                                paperDict["summary\(i)"] = item
                                
                            }
                            else if item.contains("pdf\(i)") {
                                item = item.replacingOccurrences(of: "pdf\(i): ", with: "")
                                paperDict["pdf\(i)"] = item
                                
                            }
                        }
                    }
                                            
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

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
