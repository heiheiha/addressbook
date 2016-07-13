//
//  update.swift
//  addressbook
//
//  Created by  黄磊 on 16/7/13.
//  Copyright © 2016年  黄磊. All rights reserved.
//

import UIKit

class update: UIViewController {
    var db:SQLiteDB!
   
    @IBOutlet weak var htext4: UITextField!
    @IBOutlet weak var htext5: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    
    @IBAction func updateset(sender: AnyObject) {
        update()
    }
    @IBAction func updeteset1(sender: AnyObject) {
        update1()
    }
    @IBAction func updateset2(sender: AnyObject) {
        update2()
    }
    
    func update(){
        let value1=htext4.text!
        let value2=htext5.text!
        let sql = "update tuser set mobile='\(value2)' where name='\(value1)'"
        let result = db.execute(sql)
        print(result)
    }
    func update1(){
        let value1=htext4.text!
        let value2=htext5.text!
        let sql = "update tuser set address='\(value2)' where name='\(value1)'"
        let result = db.execute(sql)
        print(result)
    }
    func update2(){
        let value1=htext4.text!
        let value2=htext5.text!
        let sql = "update tuser set email='\(value2)' where name='\(value1)'"
        let result = db.execute(sql)
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}