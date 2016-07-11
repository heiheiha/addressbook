//
//  selete.swift
//  addressbook
//
//  Created by  黄磊 on 16/7/4.
//  Copyright © 2016年  黄磊. All rights reserved.
//

import UIKit

class selete: UIViewController {
    var db:SQLiteDB!
    @IBOutlet weak var htext3: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    @IBAction func selete(sender: AnyObject) {
        if htext3.text==""
        {
            UIAlertView(title: "提示", message: "内容输入为空", delegate: nil, cancelButtonTitle: "确认").show()//tille标题message信息delegate自身为空cancelButtonTitle关闭按钮show显示对话框
        }else
        {
            sel()
        }
    }
    
    @IBAction func selete1(sender: AnyObject) {
        if htext3.text==""
        {
            UIAlertView(title: "提示", message: "内容输入为空", delegate: nil, cancelButtonTitle: "确认").show()//tille标题message信息delegate自身为空cancelButtonTitle关闭按钮show显示对话框
        }else
        {
            sele()
        }
    }
    
    func sel(){
        let value=htext3.text!
        htext3.text!=""
        let data = db.query("select * from tuser where name='\(value)'")
            for var x=0;x<data.count;x++
            {
                //获取最后一行数据显示
                let user = data[x]
            htext3.text! += "姓名：" + String(user["name"]!) + " 电话：" + String(user["mobile"]!)  + " email：" + String(user["email"]!) +  " 地址：" + String(user["address"]!)+"\n"
            }
    }
    
    func sele(){
        let value=htext3.text!
        htext3.text!=""
        let data = db.query("select * from tuser where mobile='\(value)'")
        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let user = data[x]
            htext3.text! += "姓名：" + String(user["name"]!) + " 电话：" + String(user["mobile"]!)  + " email：" + String(user["email"]!) +  " 地址：" + String(user["address"]!)+"\n"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

