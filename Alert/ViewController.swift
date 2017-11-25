//
//  ViewController.swift
//  Alert
//
//  Created by soyoung on 2017. 11. 26..
//  Copyright © 2017년 soyoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imgOn : UIImage = UIImage(named: "lamp-on")!
    let imgOff : UIImage = UIImage(named: "lamp-off")!
    let imgRemove : UIImage = UIImage(named: "lamp-remove")!
    @IBOutlet weak var lampImg: UIImageView!
    
    var isLampOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lampImg.image = UIImage(named: "lamp-on")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn == true){
            //메시지 박스 생성
            let alert = UIAlertController(title: "경고", message: "현재 램프가 켜져있습니다.", preferredStyle: .alert)

            let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)

            //버튼 생성
            alert.addAction(onAction)
            //메시지 박스 모달 형태로 띄우기
            present(alert, animated: true, completion: nil)
        }else {
            lampImg.image = self.imgOn
            isLampOn = true
        }
        
//        //메시지 박스 생성
//        let alert = UIAlertController(title: "알림", message: "램프를 켜시겠습니까?", preferredStyle: .alert)
//
//        let onAction = UIAlertAction(title: "YES", style: .default, handler: {
//            (action) in
//            self.lampImg.image = self.imgOn
//        })
//
//        //버튼 생성
//        alert.addAction(onAction)
//        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: {
//            (action) in
//            self.lampImg.image = self.imgOff
//        }))
//        //메시지 박스 모달 형태로 띄우기
//        present(alert, animated: true, completion: nil)
//
//        //present(alert, animated: true, completion: nil) // 닫는 버튼 없는 메시지 창
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampOn){
            //메시지 박스 생성
            let alert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: .alert)
            
            let onAction = UIAlertAction(title: "NO", style: .default, handler: {
                (action) in
                self.lampImg.image = self.imgOn
                self.isLampOn = true
            })
            
            //버튼 생성
            alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {
                (action) in
                self.lampImg.image = self.imgOff
                self.isLampOn = false
            }))
            alert.addAction(onAction)
            //메시지 박스 모달 형태로 띄우기
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: .alert)
        
        let onAction = UIAlertAction(title: "No, lamp on", style: .default, handler: {
            (action) in
            self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let offAction = UIAlertAction(title: "No, lamp Off", style: .default, handler: {
            (action) in
            self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let removeAction = UIAlertAction(title: "YES", style: .default, handler: {
            (action) in
            self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        //버튼 생성
        alert.addAction(offAction)
        alert.addAction(onAction)
        alert.addAction(removeAction)
        //메시지 박스 모달 형태로 띄우기
        present(alert, animated: true, completion: nil)
        
    }
}

