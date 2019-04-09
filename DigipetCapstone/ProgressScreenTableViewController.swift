//
//  ProgressScreenTableViewController.swift
//  DigipetCapstone
//
//  Created by Cassandra on 4/2/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class ProgressScreenTableViewController : UITableViewController {
    
    var tableViewData = [cellData]()
    var lang = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let language = UserDefaults.standard.string(forKey: "language") {
            switch language {
            case "zh_Hans":
                lang = 0
                break
            case "fr_FR":
                lang = 2
                break
            case "es_ES":
                lang = 1
                break
            default:
                lang = 0
                
            }
        } else {
            lang = 0
        }
        
        tableViewData = [cellData(opened: false, title: "title1", sectionData: ["cell1", "cell2", "cell3"]), cellData(opened: false, title: "title1", sectionData: ["cell1", "cell2", "cell3"]), cellData(opened: false, title: "title1", sectionData: ["cell1", "cell2", "cell3"]), cellData(opened: false, title: "title1", sectionData: ["cell1", "cell2", "cell3"])]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count
        }
        else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            return cell
        }
       
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        
        print("infoButtonPressed")
        let parent = self.parent as! LevelVC
        let ib = sender as! LessonButton
        parent.lessonFocus = ib.lesson
        parent.text = "hello"
        parent.infoLessonName.text = ib.lesson?.name
        parent.infoVH.text = ib.lesson?.infoVH
        parent.infoGD.text = ib.lesson?.infoGD
        UIView.animate(withDuration: 0.3){
            print("animating")
            parent.blur.isHidden = false
            parent.infoView.isHidden = false
            parent.blur.alpha = 1
            parent.infoView.alpha = 1
        }
        
    }
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let vc = segue.destination as? LevelVC {
    //            let ib = sender as! LessonButton
    //            vc.lessonFocus = ib.lesson
    //            vc.text = lessonNumber
    //            vc.showInfo = "yes"
    //        }
    //    }
    
    
}
