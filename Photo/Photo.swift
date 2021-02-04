//
//  Photo.swift
//  Photo
//
//  Created by Chhai Chivon on 4/2/21.
//

import Foundation
import SwiftyJSON


class Photo {
        
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
    
    init(_ data: JSON) {
            albumId = data["albumId"].int ?? 0
            id = data["id"].int ?? 0
            title = data["title"].string ?? ""
            url = data["url"].string ?? ""
            thumbnailUrl = data["thumbnailUrl"].string ?? ""
    }
    
}
