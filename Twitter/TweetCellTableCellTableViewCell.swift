//
//  TweetCellTableCellTableViewCell.swift
//  Twitter
//
//  Created by Jonathan Leibovici on 9/29/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    var isRetweeted : Bool = false
    
    
    @IBOutlet weak var retweetButton:   UIButton!
    
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("favorite did not succeed:\(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("unfavored did not succeed:\(error)")
            })
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        if !isRetweeted{
            print(isRetweeted)
            TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
                self.isRetweeted = true
            }, failure: { (error ) in
                self.setRetweeted(false)
                print("error retweet did not work\(error)")
            })
            
        }else{
            
            TwitterAPICaller.client?.unRetweet(tweetId: tweetId, success: {
                self.setRetweeted(false)
                self.isRetweeted = false
            }, failure: { (error ) in
                self.setRetweeted(true)
                print("error retweet did not work\(error)")
            })
        }
        
       
        
        
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"),for:UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon-2"),for:UIControl.State.normal)
        }
        
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green-1"), for: UIControl.State.normal)
            //retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
           // retweetButton.isEnabled = true
            
        }
    }
    

    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
