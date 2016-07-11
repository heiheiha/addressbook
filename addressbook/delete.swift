//
//  delete.swift
//  addressbook
//
//  Created by  黄磊 on 16/7/2.
//  Copyright © 2016年  黄磊. All rights reserved.
//

import UIKit

class delete: UIViewController {
    var db:SQLiteDB!
    @IBOutlet weak var htext1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    @IBAction func hdeleteuser(sender: AnyObject) {
        if htext1.text==""
        {
            UIAlertView(title: "提示", message: "内容输入为空", delegate: nil, cancelButtonTitle: "确认").show()//tille标题message信息delegate自身为空cancelButtonTitle关闭按钮show显示对话框
        }
        hdeleteuser()
    }

    func hdeleteuser(){
        let value=htext1.text!
        //print("\(value)")
        let sql = "delete from tuser where name='\(value)'"
        //let sql = "delete from tuser where moblie='\(value)'"
        let result = db.execute(sql)
        print(result)
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
