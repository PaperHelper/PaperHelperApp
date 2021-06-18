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
                
                NavigationLink(destination: Paper4thView()){
                    VStack{
                        Text(paperDict["title3"] ?? "").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        
                        Text(paperDict["summary3"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문4 VStack
                }//논문4 Navigation
                
                NavigationLink(destination: Paper5thView()){
                    VStack{
                        Text(paperDict["title4"] ?? "").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        
                        Text(paperDict["summary4"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문5 VStack
                }//논문5 Navigation
                
                NavigationLink(destination: Paper6thView()){
                    VStack{
                        Text(paperDict["title5"] ?? "").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        
                        Text(paperDict["summary5"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문6 VStack
                }//논문6 Navigation
                
                NavigationLink(destination: Paper7thView()){
                    VStack{
                        Text(paperDict["title6"] ?? "").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        
                        Text(paperDict["summary6"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문7 VStack
                }//논문7 Navigation
                
                NavigationLink(destination: Paper8thView()){
                    VStack{
                        Text(paperDict["title7"] ?? "").font(.system(size: 19, weight: .semibold))
                            .lineLimit(1)
                            .frame(width: 350, height: 60)
                            .multilineTextAlignment(.leading)
                        
                        Text(paperDict["summary7"] ?? "")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading).lineLimit(7)
                    }//논문8 VStack
                }//논문8 Navigation
                
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

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
