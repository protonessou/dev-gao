//
//  ViewController.swift
//  GYPageViewController
//
//  Created by GaoYu on 16/6/12.
//  Copyright © 2016年 GaoYu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "GYPageViewController"
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CustomCell")
    }
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "GYTapPageViewController"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "GYPageViewController"
        }

        cell.setSelected(false, animated: false)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc:GYTabPageViewController
        if indexPath.row == 0 {
            var titlesArray:Array<String> = Array<String>()
            var pageControllers:Array<TestChildViewController> = Array<TestChildViewController>()
            let colorStep:CGFloat = 1/4
            for i in 0...20 {
                titlesArray.append("tab \(i)")
                let tabVc = TestChildViewController()
                tabVc.pageIndex = i
                tabVc.view.backgroundColor = UIColor(red: colorStep * CGFloat((i + 1) % 2), green: colorStep * CGFloat((i + 1)  % 3), blue: colorStep * CGFloat((i + 1)  % 5), alpha: 1)
                
                let label = UILabel(frame: CGRectMake(100,100,100,100))
                label.backgroundColor = UIColor.grayColor()
                label.text = "tab \(i)"
                label.textAlignment = .Center
                tabVc.view.addSubview(label)
                
                pageControllers.append(tabVc)
            }
            vc = GYTabPageViewController(pageTitles: titlesArray, pageControllers: pageControllers)
            vc.showPageAtIndex(2, animated: false)
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            
        }
    }
}

