//
//  TweetViewController.swift
//  Twitter
//
//  Created by Jonathan Leibovici on 10/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //this becomesfirstresponder is saying i can take text in  
        tweetTextView.becomeFirstResponder()
    }
    
    
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    
    @IBAction func Tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            //if its empty we want to write a tweet
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("error posting tweet\(error)")
                self.dismiss(animated: true, completion: nil)
            })
        //else if the next is not empty
        }else{
            self.dismiss(animated: true, completion: nil)
        }
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
