//
//  Services.swift
//  Translate
//
//  Created by Alexandra Gorshkova on 02/06/2019.
//  Copyright © 2019 Alexandra Gorshkova. All rights reserved.
//

import Foundation
import CoreData

class Services {
    
    let key = "trnsl.1.1.20190602T140521Z.d089a2d109a71c3c.73c78b7590714c0a56d876289d4417d9cec5fd89"
    let lang = "ru-en"
    
    let db: AppDelegate
    let context: NSManagedObjectContext
    
    init(db: AppDelegate) {
        self.db = db
        self.context = db.persistentContainer.viewContext
    }
    
    func addWord(word: String, translate: String) {
        let words = Words(context: context)
        words.word = word
        words.translate = translate
        db.saveContext()
    }
    
    func urlSession(text: String, completion: @escaping (String) -> Void){
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        
        //конструктор url
        var urlConstruction = URLComponents()
        urlConstruction.scheme = "https"
        urlConstruction.host = "translate.yandex.net"
        urlConstruction.path = "/api/v1.5/tr.json/translate"
        urlConstruction.queryItems = [
            URLQueryItem(name: "key" , value: key),
            URLQueryItem(name: "text", value: text),
            URLQueryItem(name: "lang" , value: lang),
            URLQueryItem(name: "format", value: "plain")
        ]
        
        var request = URLRequest(url: urlConstruction.url!)
        request.httpMethod = "POST"
        print(request)
        
        let task = session.dataTask(with: request){(data, request, Error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments )
            let response = json as! [String: Any]
            let texts = response["text"] as! [String]
            if !texts.isEmpty {
                completion(texts[0])
            } else {
                completion("")
            }
            self.addWord(word: text, translate: texts[0])
            
        }
        task.resume()
        
    }
}
