//
//  Pagination.swift
//  Photo
//
//  Created by Chhai Chivon on 4/2/21.
//

import Foundation
import SwiftyJSON

class Pagination {
    
    var page: Int
    var limit: Int
    var totalCount: Int
    var totalPages: Int
    
    init() {
        page = 0
        limit = 0
        totalCount = 0
        totalPages = 0
   }
        
   init(_ data: JSON) {
        page = data["page"].int ?? 0
        limit = data["limit"].int ?? 0
        totalCount = data["total_count"].int ?? 0
        totalPages = data["total_pages"].int ?? 0
    }
}
