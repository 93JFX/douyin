//
//  CommentController.swift
//  myDouyin
//
//  Created by jfx on 2019/12/5.
//  Copyright © 2019 zkbc. All rights reserved.
//

import UIKit

class CommentController: UIViewController {

    @IBOutlet weak var commontAreaView: UIView!
    
    @IBAction func disappareCom(_ sender: UITapGestureRecognizer) {
        //判断位置是否在评论之外
        
        let tapPoint = sender.location(in: commontAreaView)
        if !commontAreaView.layer.contains(tapPoint) {
            self.dismiss(animated: true)
        }
    }
    @IBAction func tapClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
