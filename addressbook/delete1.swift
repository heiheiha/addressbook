//
//  delete1.swift
//  addressbook
//
//  Created by  黄磊 on 16/7/4.
//  Copyright © 2016年  黄磊. All rights reserved.
//

import UIKit

class delete1: UIViewController {
    
    var db:SQLiteDB!
    
    
    @IBOutlet weak var htext2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    
    @IBAction func hdeleteuser2(sender: AnyObject) {
        hdeleteuser2()
    }
    
    
    func hdeleteuser2(){
        let value=htext2.text!
        //print("\(value)")
        //let sql = "delete from tuser where name='\(value)'"
        let sql = "delete from tuser where mobile='\(value)'"
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
