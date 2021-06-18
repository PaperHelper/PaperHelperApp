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
    let summary0, pdf0, tag0, title1, author1: String
    let publication1, year1, summary1, pdf1, tag1: String
    let title2, author2, publication2, year2: String
    let summary2, pdf2, tag2: String
    let title3, author3, publication3, year3: String
    let summary3, pdf3, tag3: String
    let title4, author4, publication4, year4: String
    let summary4, pdf4, tag4: String
    let title5, author5, publication5, year5: String
    let summary5, pdf5, tag5: String
    let title6, author6, publication6, year6: String
    let summary6, pdf6, tag6: String
    let title7, author7, publication7, year7: String
    let summary7, pdf7, tag7: String
    let title8, author8, publication8, year8: String
    let summary8, pdf8, tag8: String
    let title9, author9, publication9, year9: String
    let summary9, pdf9, tag9: String
}


struct ContentView: View {
    
    @State var interestFlag : Bool = true
    @State var interestData : Data?
    @State var interestString : String = ""
    @State var interestArr = [String]()
    @State var paperDict: Dictionary <String, String> = [:]

    let usingBlue = Color(red: 0.576, green: 0.663, blue: 0.82)
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    if interestFlag == false || interestArr.count == 0 {
                        Spacer()
                        NavigationLink(destination: InterestView()){
                            HStack {
                                Image("whiteIcon")
                                    .accentColor(Color.gray)
                                    .frame(width: 40, height: 33)
                                    .overlay( RoundedRectangle(cornerRadius: 8)
                                                .stroke(usingBlue, lineWidth: 1.5))
                                    .background(usingBlue)
                                    .cornerRadius(8)
                                    .foregroundColor(Color.white)
                                    
                            }
                        }
                        
                            
                    }
                    else{
                        HStack{
                            Spacer()
                            NavigationLink(destination: InterestView()){
                                HStack {
                                    Image("whiteIcon")
                                        .accentColor(Color.gray)
                                        .frame(width: 40, height: 33)
                                        .overlay( RoundedRectangle(cornerRadius: 8)
                                                    .stroke(usingBlue, lineWidth: 1.5))
                                        .background(usingBlue)
                                        .cornerRadius(8)
                                        .foregroundColor(Color.white)
                                        
                                }
                            }
                            
                            
                            ForEach(interestArr, id: \.self){
                                item in Text("   \(item)   ")
                                    
                                    .font(.system(size: 15))
                                    .frame(height: 33)
                                    .overlay( RoundedRectangle(cornerRadius: 8)
                                                .stroke(usingBlue, lineWidth: 1.5))
                                    .background(usingBlue)
                                    .cornerRadius(8)
                                    .foregroundColor(Color.white)
                                    
                            }
                        }
                    }
                } //end of Summary Scroll
                //Spacer()
                
                VStack{
                    List{
                        NavigationLink(destination: Paper1stView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title0"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag0"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Paper2ndView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title1"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag1"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Paper3rdView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title2"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag2"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        NavigationLink(destination: Paper4thView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title3"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag3"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Paper5thView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title4"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag4"] ?? ""
                                Text(tag)
                                    .font(.system(size: 15)).multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Paper6thView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title5"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag5"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Paper7thView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title6"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag6"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Paper8thView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title7"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag7"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Paper9thView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title8"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag8"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                        NavigationLink(destination: Paper10thView()){
                            VStack {
                                Spacer()
                                Text(paperDict["title9"] ?? "").font(.system(size: 18, weight: .semibold)).multilineTextAlignment(.leading).lineLimit(nil)
                                Spacer()
                                var tag = paperDict["tag9"] ?? ""
                                Text(tag)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(usingBlue)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                            }
                        }
                    }.listStyle(PlainListStyle())
                    
                } // end of 2 VStack
                .padding(.top, 15)
            }//end of VStack
            .navigationBarTitle("Paper Helper", displayMode: .inline)
            .padding(.top, 15)
        }//nevigationview
        .navigationViewStyle(DefaultNavigationViewStyle())
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
                    paperDict["tag\(i)"] = jsonDerived.tag0
                    print(paperDict["pdf0"])
                    i = 1
                    paperDict["title\(i)"] = jsonDerived.title1
                    paperDict["author\(i)"] = jsonDerived.author1
                    paperDict["publication\(i)"] = jsonDerived.publication1
                    paperDict["year\(i)"] = jsonDerived.year1
                    paperDict["summary\(i)"] = jsonDerived.summary1
                    paperDict["pdf\(i)"] = jsonDerived.pdf1
                    paperDict["tag\(i)"] = jsonDerived.tag1
                    i = 2
                    paperDict["title\(i)"] = jsonDerived.title2
                    paperDict["author\(i)"] = jsonDerived.author2
                    paperDict["publication\(i)"] = jsonDerived.publication2
                    paperDict["year\(i)"] = jsonDerived.year2
                    paperDict["summary\(i)"] = jsonDerived.summary2
                    paperDict["pdf\(i)"] = jsonDerived.pdf2
                    paperDict["tag\(i)"] = jsonDerived.tag2
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
