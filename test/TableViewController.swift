//
//  TableViewController.swift
//  test
//
//  Created by doriswu on 2016/1/1.
//  Copyright © 2016年 doriswu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var data: [[String]]?
    var isOpen: [Bool]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell1")
        tableView.registerNib(UINib(nibName: "TableViewCell2", bundle: nil), forCellReuseIdentifier: "Cell2")
        
        isOpen = [false, false, false] //tells us the section is open or not
        
        data = [["s1Title"], ["s2Title","r1","r2"], ["s3Title"]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return (data?.count)!
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isOpen![section] {
            
            return data![section].count
            
        } else {
            return 1
        }
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let arr = data![indexPath.section] as NSArray
        
        let content = arr[indexPath.row] as! String
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell1", forIndexPath: indexPath) as! TableViewCell
            
            
            cell.lbTitle.text = content
            cell.lbTitle.textColor = UIColor.whiteColor()
            cell.backgroundColor = UIColor(red: 0.33, green: 0.33, blue: 0.33, alpha: 1)
            
            return cell
        } else {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell2", forIndexPath: indexPath) as! TableViewCell2
            
            cell.lbContent.text = content
            cell.lbContent.textColor = UIColor.whiteColor()
            cell.backgroundColor = UIColor.grayColor()
            
            return cell
        }
        



    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0) {
            
            

            
            
            isOpen![indexPath.section] = !isOpen![indexPath.section]
            
            
            
            tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
            
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! TableViewCell
            UIView.animateWithDuration(0.1, animations: {
                
                if self.isOpen![indexPath.section] {
                    cell.img.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
                    
                } else {
                    cell.img.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
                }
            })
        }
    }
}