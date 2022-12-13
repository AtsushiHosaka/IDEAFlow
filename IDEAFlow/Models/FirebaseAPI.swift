//
//  FirebaseAPI.swift
//  IDEAFlow
//
//  Created by 保坂篤志 on 2022/12/14.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class FirebaseAPI {
    
    static let shared = FirebaseAPI()
    
    let ref = Database.database().reference()
    
    func upload(user: String, idea: Idea) {
        
        do {
            
            try ref.child(user).childByAutoId().setValue(from: idea)
        }catch {
            
            return
        }
    }
    
    func getDatas(user: String, completionHandler: @escaping ([Idea]) -> Void) {
        
        ref.child(user).getData(completion: { error, snapshot in

            if error != nil {

                completionHandler([])
            }

            do {
                
                guard let children = snapshot?.children.allObjects as? [DataSnapshot] else {
                    
                    completionHandler([])
                    return
                }
                
                let ideas = try children.compactMap { snapshot in
                    
                    return try snapshot.data(as: Idea.self)
                }
                
                completionHandler(ideas)
            }catch {

                completionHandler([])
            }
        })
        
        
        
    }
}
