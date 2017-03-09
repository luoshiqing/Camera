//
//  CemViewController.swift
//  ImagePicker
//
//  Created by sqluo on 2017/3/1.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit

class CemViewController: UIViewController {

    
    deinit {
        print("CemViewController->释放")
    }
    
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btn.addTarget(self, action: #selector(self.btnAct), for: .touchUpInside)
    }
    //相机
    var camera: Camera?

    func btnAct(){
        self.camera = Camera(target: self) { (img) in
            print(img)
        }
        let actionSheet = UIAlertController(title: "选择照片", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "拍照", style: UIAlertActionStyle.destructive, handler: { (act:UIAlertAction) in
            self.camera?.camera()
        }))
        actionSheet.addAction(UIAlertAction(title: "相册", style: UIAlertActionStyle.destructive, handler: { (act:UIAlertAction) in
            self.camera?.photo()
            
        }))
        actionSheet.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
