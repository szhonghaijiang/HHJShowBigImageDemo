//
//  ViewController.swift
//  HHJShowBig
//
//  Created by bu88 on 2016/12/24.
//  Copyright © 2016年 HHJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ivs: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in stride(from: 0, through: 8, by: 1) {
            let iv = ivs[index]
            iv.image = UIImage(named: "\(index + 1)")
            iv.tag = index
            iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.tapImage(sender:))))
            iv.isUserInteractionEnabled = true
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tapImage(sender: UITapGestureRecognizer){
        if let iv = sender.view as? UIImageView {
            /// 传入图片容器数组和点击第几张，创建一个显示放大的控件
            if let show = HMShowBigImageView(imageViews: ivs, currentIndex: iv.tag) {
                /// 设置动画时间
                show.showDuration = 0.25
                /// 设置背景
                show.HHJBackColor = UIColor.black
                /// 显示
                show.show()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

