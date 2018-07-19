//
//  RemoteDataManager.swift
//  stashTakeHomeChallenge
//
//  Created by Eugene Mammie on 7/12/18.
//  Copyright © 2018 Eugene Mammie. All rights reserved.
//

import Foundation

enum DataManagerError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

class RemoteDataManager : AchievementListRemoteDataManagerInputDelegate {

    var remoteRequestHandler : AchievementListRemoteDataManagerOutputDelegate?
    
    lazy var session : AchievementListURLSessionProtocol? = URLSession.shared
    var url : URL? = URL(fileURLWithPath: Bundle.main.path(forResource: "achievements", ofType: "json")!)
    
    
    
    func retrieveAchievementLevels() throws -> [Achievement] {
        var results = [Achievement]()
         if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
         do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = json as? Dictionary<String, AnyObject>, let achievements = jsonResult["achievements"] as? [[String : Any]] {
         
                
                    for dict in achievements{
                        results.append(Achievement(dict)!)
                    }
                    return results
                }
            }
         }
        return results
    }
    func retrieveAchievementLevels(completion: @escaping ([Achievement]?) -> ()) {
        var results = [Achievement]()
        guard let aURL = url else {
            return
        }
        session?.dataTask(with: aURL) { Data, URLResponse, Error in
                
                if Error != nil {
                    print(Error.debugDescription)
                }
                let json = try? JSONSerialization.jsonObject(with: Data!, options: .mutableContainers)
                if let jsonResult = json as? Dictionary<String, AnyObject>, let achievements = jsonResult["achievements"] as? [[String : Any]] {
                    
                        for dict in achievements{
                            results.append(Achievement(dict)!)
                        }
                        completion(results)
                    }
                
            }.resume()
        
        }
    
    }


extension URLSession : AchievementListURLSessionProtocol {}
    
protocol AchievementListURLSessionProtocol{
    
    func dataTask(with: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask

}
    

