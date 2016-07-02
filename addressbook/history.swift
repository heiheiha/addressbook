//
//  history.swift
//  addressbook
//
//  Created by  黄磊 on 16/7/2.
//  Copyright © 2016年  黄磊. All rights reserved.
//

import UIKit

class history: UIViewController {

    @IBOutlet weak var htext: UITextView!
    
    
    
    var db:SQLiteDB!
    
    @IBAction func hsee(sender: UIButton) {
        htext.text=""

        let data = db.query("select * from tuser")

        for var x=0;x<data.count;x++
        {
            //获取最后一行数据显示
            let user = data[x]
            htext.text! += "姓名：" + String(user["name"]!) + " 电话：" + String(user["mobile"]!)  + " email：" + String(user["email"]!) +  " 地址：" + String(user["address"]!)+"\n"
            
        }


    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
        
        // initUser()
    }
    
    

    @IBAction func hdelete(sender: AnyObject) {
            let sql = "delete from tuser"
            let result = db.execute(sql)
            print(result)
        
        

    }
    
    func history (){
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
