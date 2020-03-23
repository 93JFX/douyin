//
//  VideoCell.swift
//  myDouyin
//
//  Created by jfx on 2019/12/2.
//  Copyright © 2019 zkbc. All rights reserved.
//

import UIKit
import MarqueeLabel
import Kingfisher
import ChainableAnimations

class VideoCell: UITableViewCell {
    var animator1 : ChainableAnimator!
    var animator2 : ChainableAnimator!

    override func prepareForReuse() {
        //重置关注按钮的状态 testlalala
        if animator1 != nil {
            animator1.stop()
            addFollowBtn.transform = .identity
            addFollowBtn.layer.removeAllAnimations()
            addFollowBtn.setImage(UIImage(named: "icon_personal_add_little"), for: .normal)
        }
        if animator2 != nil {
            animator2.stop()
//            subDiskView.transform = .identity
//            subDiskView.layer.removeAllAnimations()
        }
        diskView.resetViewAnimation()
        
    }
    @IBAction func addFollowTap(_ sender: UIButton) {
        animator1 = ChainableAnimator(view: sender)
        UIView.transition(with: sender, duration: 0.5, options: .transitionCrossDissolve, animations: {
            sender.setImage((UIImage(named: "iconSignDone")), for: .normal)
        }) { (_) in
            self.animator1.rotate(angle: 360)
            .thenAfter(t: 0.5)
            .transform(scale: 0)
            .animate(t: 0.5)
            
        }
        
    }
    var aweme :AwemeList! {
        didSet{
            authorLabel.text = aweme.author!.nickname
            descLabel.text = aweme.desc
            //设置视频封面图片
            let cover = aweme.video!.cover!.urlList![0]
            let coverUrl = URL(string: cover)
            coverImageView.kf.setImage(with: coverUrl)
            //设置音乐标题和作者
            musicLabel.text = aweme.music!.title! + "-" + aweme.music!.author!
            //作者头像
            let authorAvatar = aweme.author!.avatarThumb!.urlList![0]
            let authorAvatarUrl = URL(string: authorAvatar)
            followBtn.kf.setImage(with: authorAvatarUrl, for: .normal)
//            followBtn.layer.cornerRadius = 25
//            followBtn.clipsToBounds = true
            //点赞，评论，分享数
            labelLikeNum.text = aweme.statistics?.diggCount?.toWanStr
            labelShareNum.text = aweme.statistics?.shareCount?.toWanStr
            labelCommentNum.text = aweme.statistics?.commentCount?.toWanStr
            
            //唱盘音乐封面
            let musicCover = aweme.music!.coverThumb!.urlList![0]
            musicCoverImageView.kf.setImage(with: URL(string: musicCover), for: .normal)
            animator2 = ChainableAnimator(view: subDiskView)
            animator2.rotate(angle: 180).animateWithRepeat(t: 3.5, count: 50)
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 0)
            diskView.raiseAnimate(imageName: "icon_home_musicnote2", delay: 1)
            diskView.raiseAnimate(imageName: "icon_home_musicnote1", delay: 2)


        }
    }
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var pauseImageView: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var musicLabel: MarqueeLabel!
    
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var addFollowBtn: UIButton!
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var labelLikeNum: UILabel!
    
    @IBOutlet weak var commonBtn: UIButton!
    @IBOutlet weak var labelCommentNum: UILabel!
    
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var labelShareNum: UILabel!
    
    @IBOutlet weak var diskView: UIView!
    @IBOutlet weak var subDiskView: UIView!
    //此两处本为imageview，写成了button，后期若有影响再改
    @IBOutlet weak var musicCoverImageView: UIButton!
    @IBOutlet weak var rotateDiskView: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
