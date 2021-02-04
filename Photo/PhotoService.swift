//
//  PhotoService.swift
//  Photo
//
//  Created by Chhai Chivon on 4/2/21.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol PhotoServiceDelegate {
    func didReceivedPhoto(with photos: [Photo]?, pagination: Pagination?, error: Error?)
    func didReceivedPhoto(with photo: Photo?, error: Error?)
    func didAddedPhoto(error: Error?)
    func didUpdatedPhoto(error: Error?)
}

extension PhotoServiceDelegate {
    func didReceivedPhoto(with photos: [Photo]?, pagination: Pagination?, error: Error?){}
    func didReceivedPhoto(with photo: Photo?, error: Error?){}
    func didAddedPhoto(error: Error?){}
    func didUpdatedPhoto(error: Error?){}
}

class PhotoService {
    
    var delegate: PhotoServiceDelegate?

    func getData(pageNumber: Int) {
        AF.request("https://jsonplaceholder.typicode.com/photos", parameters: ["_page" : pageNumber, "_limit" : 5])
                    .responseJSON { (response) in
                        switch response.result {
                            case .success(let value):
                                
                                let json = JSON(value)
                                let pagination = Pagination()
                                let photos = json.arrayValue.map { Photo($0) }
                                self.delegate?.didReceivedPhoto(with: photos, pagination: pagination, error: nil)
                                
                            case .failure(let error):
                                  self.delegate?.didReceivedPhoto(with: nil, pagination: nil, error: error)
                        }
                    }
    }
}
