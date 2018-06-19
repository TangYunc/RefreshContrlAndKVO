//
//  ViewController.swift
//  RefreshContrlAndKVO
//
//  Created by 中发 on 2018/6/19.
//  Copyright © 2018年 中发. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var refreshCtrl = TYCRefreshCtrl()
    
    /**
     如果用户不放手，下拉到一定程度，会进入自动刷新状态，浪费流量
     如果程序主动调用beginRefreshing()，不显示菊花转动器，这是Xcode8.0出现的
     自定义刷新控件，最重要要解决的就是用户放手，不再刷新
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置contentInset
//        tableView.adjustedContentInset =
//        tableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        //添加刷新控件
        tableView.addSubview(refreshCtrl)
        refreshCtrl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        loadData()
        
    }
    @objc func loadData() {
        print("开始刷新")
        refreshCtrl.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            print("结束刷新")
            self.refreshCtrl.endRefreshing()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

