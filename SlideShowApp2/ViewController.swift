//
//  ViewController.swift
//  SlideShowApp2
//
//  Created by 広部千恵子 on 2018/03/15.
//  Copyright © 2018年 広部千恵子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //IBOutlet
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    //再生ボタンが押された
    @IBAction func playTapped(_ sender: Any) {
        if timer != nil {
            playButton.setTitle("再生", for: .normal)
            timer.invalidate()
            timer = nil
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            // タイマーを再生するコード
        }
        else {
            playButton.setTitle("停止", for: .normal)
            // タイマーを停止するコード
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
            nextButton.isEnabled = false
            prevButton.isEnabled = false
        }
    }
    var count = 0   // ← 追記
    var timer: Timer!
    var timer_sec: Float = 0
    var imageNames = [
        "cyclamen perisicum 6.JPG",
        "01Anemone coronaria 2のコピー.jpg",
        "02Adonis20100269.jpg"
    ]
    //進むボタンが押された
    @IBAction func nextTapped(_ sender: Any) {
        
        
        count = count + 1 // ← 追記
        if count == 3 {
            count = 0
            
        }
        print(count)
        imageView.image = UIImage(named: imageNames[count])
        
    }
    
    //戻るボタンが押された
    @IBAction func prevTapped(_ sender: Any) {
        
        count = count - 1 // ← 追記
        if count == -1 {
            count = 2
            
            
        }
        print(count)
        imageView.image = UIImage(named: imageNames[count])
    }
    
    @IBAction func tapview(_ sender: AnyObject)
    {
        performSegue(withIdentifier: "flowers", sender: nil)
        print("タップされました")
    }// segueを使用して画面遷移する際に呼ばれるメソッド
    @IBAction func unwind(_segue: UIStoryboardSegue){}
    @IBAction func unwind(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 遷移先の画面を取得    asの後は遷移先画面のクラスを指定
        // 遷移先の画面を取得
        let vc = segue.destination as! ResultViewController
        // 遷移先の画面に値を設定
         vc.imageName = imageNames[count]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageNames[count])
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///viewをタップされた時の処理
    
    @objc func updateTimer(timer: Timer){
        count = count + 1 // ← 追記
        if count == 3 {
            count = 0
            
        }
        print(count)
        imageView.image = UIImage(named: imageNames[count])
        
    }
    
}



