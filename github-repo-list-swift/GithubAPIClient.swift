//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()){
        let urlString = "https://api.github.com/repositories?client_id=\(gitClientId)&client_secret=\(gitSecretId)"
        let url = NSURL(string: urlString)
        let session = NSURLSession.sharedSession()
        guard let potentialURL = url else {assertionFailure("Invalid URL"); return}
        let task = session.dataTaskWithURL(potentialURL) { (data, response, error) in
            guard let data = data else { assertionFailure("Unable to get data \(error?.localizedDescription)"); return }
            
            if let responseArray = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSArray {
                if let responseArray = responseArray {
                    completion(responseArray)
                }
            }
        }
        task.resume()
    }
    
    
}

