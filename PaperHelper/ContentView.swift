//
//  ContentView.swift
//  PaperHelper
//
//  Created by 신나현 on 2021/05/31.
//

import SwiftUI

// MARK: - PaperGet
struct PaperGet: Codable {
    let title0, author0, publication0, year0: String
    let summary0, pdf0, title1, author1: String
    let publication1, year1, summary1, pdf1: String
    let title2, author2, publication2, year2: String
    let summary2, pdf2: String
}


struct ContentView: View {
    
    @State var interestFlag : Bool = true
    @State var interestData : Data?
    @State var interestString : String = ""
    @State var interestArr = [String]()
    @State var paperDict: Dictionary <String, String> = [:]
    
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
                        
                    } // end of onAppear
                    
                    
                }   //HStack
                .padding(.top, 40)
                .padding([.leading,.trailing], 80)
                
                VStack{
                    if interestFlag == false || interestArr.count == 0 {
                        List{
                            Text("Select your interest first!!")
                        }
                        .listStyle(PlainListStyle())
                    }
                    else {
                        List{
                            ForEach(interestArr, id: \.self){
                                item in Text(item)
                            }
                            
                        }//end of List
                        .listStyle(PlainListStyle())
                    }
                }//end of VStack
                
                
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
                    
                    Text(paperDict["title0"] ?? "")
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.center).lineLimit(1)
                        .frame(width: 370, height: 60)
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2))
                    
                    
                    
                    
                    Text(paperDict["title1"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.center).lineLimit(1)
                        .frame(width: 370, height: 60)
                        
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2))
                    
                    
                    
                    Text(paperDict["title2"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.center).lineLimit(1)
                        .frame(width: 370, height: 60)
                        .overlay( RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2))
                    
                    
                    
                } // end of 2 VStack
                .padding(.bottom, 100)
            }//end of VStack
            .navigationBarTitle("Paper Helper", displayMode: .inline)
        }//nevigationview
        .navigationViewStyle(DefaultNavigationViewStyle())
        .onAppear(){
            print("here")
            //jsonPost()
            /*
            let seconds = 5.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                // Put your code which should be executed with a delay here
                requestGet()
            }*/
            requestGet()
        }
        
    }
    
    func jsonPost() {
        // 1. 전송할 값 준비
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let directoryURL = documentsURL.appendingPathComponent("DoNotDelete")
        let interestPath = directoryURL.appendingPathComponent("PaperInterest.txt")
        var interestModi = ""
        if !fileManager.fileExists(atPath: interestPath.path) {
            interestFlag = false
        }
        if interestFlag == true{
            interestData = fileManager.contents(atPath : interestPath.path)!
            interestString = String(data: interestData!, encoding: .utf8)!
            interestModi = interestString.replacingOccurrences(of: "\n", with: "\t")
            interestArr = interestString.components(separatedBy: "\n")
            if interestArr.count == 0 {
                interestModi = ""
            }
        }
        
        let param = ["interest": interestModi] // JSON 객체로 변환할 딕셔너리 준비
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        print()
        print("paramData: \(paramData.count)")
        print()
        // 2. URL 객체 정의
        let url = URL(string: "http://163.239.28.25:5000/interest");
        
        // 3. URLRequest 객체 정의 및 요청 내용 담기
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // 4. HTTP 메시지에 포함될 헤더 설정
        request.addValue("applicaion/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("\nerror=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("\nstatusCode should be 200, but is \(httpStatus.statusCode)")
                print("\nresponse = \(response)")
            }
            
            
            let responseString = String(data: data, encoding: .utf8)
            print("\nresponseString = \(responseString)")
            
        }
        
        // 6. POST 전송
        
        task.resume()
        
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
