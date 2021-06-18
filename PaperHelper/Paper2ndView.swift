//
//  Paper1stView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

struct Paper2ndView: View {
    
    @State var alertIsVisible2 = false
    @State var paperDict: Dictionary <String, String> = [:]
    let usingBlue = Color(red: 0.576, green: 0.663, blue: 0.82)
    
    var body: some View {
        VStack{
            
            Text(paperDict["title1"] ?? "")
                .font(.system(size: 20, weight: .semibold))
                .multilineTextAlignment(.center).lineLimit(nil)
                .frame(width: 350, height: 60)
            Spacer();
            Group{
                HStack{
                    Text("Author")
                        .font(.system(size: 15))
                        .frame(width: 90, height: 30)
                        .overlay( RoundedRectangle(cornerRadius: 8)
                                    .stroke(usingBlue, lineWidth: 1.5))
                        .background(usingBlue)
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                    Text(paperDict["author1"] ?? "")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Author HStack
                Spacer();
                HStack{
                    Text("Publication")
                        .font(.system(size: 15))
                        .frame(width: 90, height: 30)
                        .overlay( RoundedRectangle(cornerRadius: 8)
                                    .stroke(usingBlue, lineWidth: 1.5))
                        .background(usingBlue)
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                    Text(paperDict["publication1"] ?? "")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Publication HStack
                
                Spacer();
                HStack{
                    Text("Year")
                        .font(.system(size: 15))
                        .frame(width: 90, height: 30)
                        .overlay( RoundedRectangle(cornerRadius: 8)
                                    .stroke(usingBlue, lineWidth: 1.5))
                        .background(usingBlue)
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                    
                    Text(paperDict["year1"] ?? "")
                        .font(.system(size: 15))
                        .frame(width: 270, height: 25)
                }//end of Year HStack
            } // end of Group
            
            Spacer();
            
            HStack{
                Text("Summary")
                    .font(.system(size: 15))
                    .frame(width: 90, height: 30)
                    .overlay( RoundedRectangle(cornerRadius: 8)
                                .stroke(usingBlue, lineWidth: 1.5))
                    .background(usingBlue)
                    .cornerRadius(8)
                    .foregroundColor(Color.white)
                
                Text("  ")
                    .font(.system(size: 15))
                    .frame(width: 270, height: 25)
            }//end of Year HStack
            
            ScrollView(.vertical, showsIndicators: false) {
                Text(paperDict["summary1"] ?? "")
                    .font(.system(size: 15))
                    .frame(width: 350)
            } //end of Summary Scroll
            
            
            if let urlString = paperDict["pdf1"]{
                
                Link(destination: URL(string: urlString)!) {
                    
                    Text("View PDF")
                        .foregroundColor(Color.white)
                        .frame(width: 380, height: 40)
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                    .stroke(usingBlue, lineWidth: 2))
                        .background(usingBlue)
                        .cornerRadius(12)
                }
            }
            
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
                    
                    i = 3
                    paperDict["title\(i)"] = jsonDerived.title3
                    paperDict["author\(i)"] = jsonDerived.author3
                    paperDict["publication\(i)"] = jsonDerived.publication3
                    paperDict["year\(i)"] = jsonDerived.year3
                    paperDict["summary\(i)"] = jsonDerived.summary3
                    paperDict["pdf\(i)"] = jsonDerived.pdf3
                    paperDict["tag\(i)"] = jsonDerived.tag3
                    
                    i = 4
                    paperDict["title\(i)"] = jsonDerived.title4
                    paperDict["author\(i)"] = jsonDerived.author4
                    paperDict["publication\(i)"] = jsonDerived.publication4
                    paperDict["year\(i)"] = jsonDerived.year4
                    paperDict["summary\(i)"] = jsonDerived.summary4
                    paperDict["pdf\(i)"] = jsonDerived.pdf4
                    paperDict["tag\(i)"] = jsonDerived.tag4
                    
                    i = 5
                    paperDict["title\(i)"] = jsonDerived.title5
                    paperDict["author\(i)"] = jsonDerived.author5
                    paperDict["publication\(i)"] = jsonDerived.publication5
                    paperDict["year\(i)"] = jsonDerived.year5
                    paperDict["summary\(i)"] = jsonDerived.summary5
                    paperDict["pdf\(i)"] = jsonDerived.pdf5
                    paperDict["tag\(i)"] = jsonDerived.tag5
                    
                    i = 6
                    paperDict["title\(i)"] = jsonDerived.title6
                    paperDict["author\(i)"] = jsonDerived.author6
                    paperDict["publication\(i)"] = jsonDerived.publication6
                    paperDict["year\(i)"] = jsonDerived.year6
                    paperDict["summary\(i)"] = jsonDerived.summary6
                    paperDict["pdf\(i)"] = jsonDerived.pdf6
                    paperDict["tag\(i)"] = jsonDerived.tag6
                    
                    i = 7
                    paperDict["title\(i)"] = jsonDerived.title7
                    paperDict["author\(i)"] = jsonDerived.author7
                    paperDict["publication\(i)"] = jsonDerived.publication7
                    paperDict["year\(i)"] = jsonDerived.year7
                    paperDict["summary\(i)"] = jsonDerived.summary7
                    paperDict["pdf\(i)"] = jsonDerived.pdf7
                    paperDict["tag\(i)"] = jsonDerived.tag7
                    
                    i = 8
                    paperDict["title\(i)"] = jsonDerived.title8
                    paperDict["author\(i)"] = jsonDerived.author8
                    paperDict["publication\(i)"] = jsonDerived.publication8
                    paperDict["year\(i)"] = jsonDerived.year8
                    paperDict["summary\(i)"] = jsonDerived.summary8
                    paperDict["pdf\(i)"] = jsonDerived.pdf8
                    paperDict["tag\(i)"] = jsonDerived.tag8
                    i = 9
                    paperDict["title\(i)"] = jsonDerived.title9
                    paperDict["author\(i)"] = jsonDerived.author9
                    paperDict["publication\(i)"] = jsonDerived.publication9
                    paperDict["year\(i)"] = jsonDerived.year9
                    paperDict["summary\(i)"] = jsonDerived.summary9
                    paperDict["pdf\(i)"] = jsonDerived.pdf9
                    paperDict["tag\(i)"] = jsonDerived.tag9
                    
                                            
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

struct Paper2ndView_Previews: PreviewProvider {
    static var previews: some View {
        Paper1stView()
    }
}
