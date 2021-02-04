//
//  PhotoTableViewController.swift
//  Photo
//
//  Created by Chhai Chivon on 4/2/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class PhotoTableViewController: UITableViewController, PhotoServiceDelegate {
    
    var data = ["A","B","C"]
    
    // Property
    var photos: [Photo] = []
    var pagination: Pagination = Pagination()
    
    let service = PhotoService()

    override func viewDidLoad() {
        super.viewDidLoad()

        service.delegate = self
        
        getData(pageNumber: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photo_cell", for: indexPath)
                
        cell.textLabel?.text = photos[indexPath.row].title
        cell.detailTextLabel?.text = photos[indexPath.row].title
       
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData(pageNumber : Int) {
        if self.pagination.page == 1 {
            // Create NVActivityIndicator
            //let size = CGSize(width: 30, height:30)
            //startAnimating(size, message: "Loading...", type: NVActivityIndicatorType.ballBeat)
        }
        service.getData(pageNumber: pageNumber)
    }
    
}
