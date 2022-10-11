//
//  feedViewController.swift
//  lijang.ios
//
//  Created by Kyle Gavin on 10/5/22.
//

import UIKit
import Parse
import AlamofireImage

class feedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var photoFeed: UITableView!
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        
        photoFeed.delegate = self
        photoFeed.dataSource = self
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.photoFeed.reloadData()
                
            }
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = photoFeed.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        
        let user = post["author"] as! PFUser
        cell.userLabel.text = user.username
        
        cell.descLabel.text = post["caption"] as? String
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoLabel.af.setImage(withURL: url)
        
        return cell
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
