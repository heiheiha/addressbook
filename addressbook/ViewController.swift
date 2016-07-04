//
//  ViewController.swift
//  addressbook
//
//  Created by  黄磊 on 16/7/2.
//  Copyright © 2016年  黄磊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     var db:SQLiteDB!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var moblie: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")

        //initUser()
    }
    
    
    
    
    
    @IBAction func save(sender: AnyObject) {
        if name.text==""||moblie.text==""||email.text==""||address.text==""
        {
            UIAlertView(title: "提示", message: "ffff", delegate: nil, cancelButtonTitle: "确认").show()//tille标题message信息delegate自身为空cancelButtonTitle关闭按钮show显示对话框
        }else
        {
            saveUser()
        }
        
    }
    
    func initUser() {
        let data = db.query("select * from tuser")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            name?.text = user["name"] as? String
            moblie?.text = user["moblie"] as? String
            email?.text = user["email"] as? String
            address?.text = user["address"] as? String
        }
    }
    
    func saveUser() {
        let hname = self.name.text!
        let hmobile = self.moblie.text!
        let hemail = self.email.text!
        let haddress = self.address.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into tuser(name,mobile,email,address) values('\(hname)','\(hmobile)','\(hemail)','\(haddress)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

