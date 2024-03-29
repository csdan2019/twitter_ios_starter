//
//  TweetViewController.swift
//  Twitter
//
//  Created by maggie on 11/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty){
        
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error Posting Tweet \(Error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else {
            self.dismiss(animated: true, completion: nil)
            
        }
            
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
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
