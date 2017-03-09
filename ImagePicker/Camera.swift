//
//  Camera.swift
//  ImagePicker
//
//  Created by sqluo on 2017/3/1.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit

class Camera: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    deinit {
        print("Camera->释放")
    }
    //图片回调
    fileprivate var imgHandle: ((UIImage?)->Swift.Void)?
    //控制器，需 weak
    fileprivate weak var target: UIViewController!
    init(target: UIViewController, handle: @escaping (UIImage?)->Swift.Void) {
        self.imgHandle = handle
        self.target = target
    }

    //1.调用照片方法
    public func photo(){
        let pick = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = .photoLibrary
        pick.allowsEditing = true
        self.target.present(pick, animated: true, completion: nil)
    }
    
    //2.调用照相机方法
    public func camera(){
        
        var sourceTyte = UIImagePickerControllerSourceType.camera
        if !UIImagePickerController .isSourceTypeAvailable(.camera)
        {
            sourceTyte = UIImagePickerControllerSourceType.photoLibrary
        }
        
        let pick = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = sourceTyte
        pick.allowsEditing = true
        self.target.present(pick, animated: true, completion: nil)
    }
    
    //相机代理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.target.dismiss(animated: true, completion: nil)
        
        var image: UIImage?
        
        if picker.allowsEditing {
            image = info[UIImagePickerControllerEditedImage] as? UIImage
        }else{
            image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        //回调图片
        self.imgHandle?(image)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.target.dismiss(animated: true, completion: nil)
    }
    
    
}

