//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    let fullName: String
    let repositoryID: String
    let htmlURL: NSURL
    
    init(dictionary: NSDictionary) {
        guard let
            name = dictionary["full_name"] as? String,
            valueAsString = dictionary["html_url"] as? String,
            valueAsURL = NSURL(string: valueAsString),
            repoID = dictionary["id"]?.stringValue
            else {fatalError("Error creating instance of GithubRepository")}
        
        fullName = name
        htmlURL = valueAsURL
        repositoryID = repoID
    }
}
