//
//  TableViewController.swift
//  GhibliFanApp
//
//  Created by Maryann Yin on 6/20/18.
//  Copyright © 2018 Maryann Yin. All rights reserved.
//

import UIKit

struct factCellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class FactsTableViewController: UITableViewController {
    
    var factTableViewData = [factCellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        factTableViewData = [factCellData(opened: false, title: "The Founders", sectionData: ["Studio Ghibli was founded by Hayao Miyazaki and Isao Takahata in 1985. The two first met while working together at the Toei Animation company."]), factCellData(opened: false, title: "Inspiration", sectionData: ["Two of Hayao Miyazaki’s biggest inspirations are manga god Osamu Tezuka and The Fleischer Brothers."]), factCellData(opened: false, title: "The Three H's", sectionData: ["Former CEO Toru Hara ran the company on the Three H’s principle: high cost, high risk, high return. This mission was all about putting in the necessary time and energy to create a high quality animated film."]), factCellData(opened: false, title: "No Alterations", sectionData: ["Studio Ghibli has a strict no alterations policy with its distribution partners. This rule was established because the American version of Nausicaä of the Valley of the Wind was heavily edited."]), factCellData(opened: false, title: "Heroes and Villains", sectionData: ["Most Studio Ghibli films don’t feature a character that is either completely bad or completely good. Instead, they tell stories with complex characters to mirror real life."]), factCellData(opened: false, title: "Two Big Projects", sectionData: ["The studio worked on both My Neighbor Totoro and Grave of the Fireflies simultaneously in 1988. Totoro was written and directed by co-founder Hayao Miyazaki while Fireflies was written and directed by co-founder Isao Takahata."]), factCellData(opened: false, title: "Documentary", sectionData: ["The Kingdom of Dreams and Madness, a 2013 documentary, offers an in-depth look at what it’s like to work at Studio Ghibli."]), factCellData(opened: false, title: "Shorts", sectionData: ["Although they’re well known for their feature films, Studio Ghibli has also created several short films such as The Whale Hunt (2001), Mei And The Kittenbus (2002), and Water Spider Monmon (2006)."]), factCellData(opened: false, title: "Museum", sectionData: ["The Ghibli Museum opened its doors in Tokyo in 2001. Hayao Miyazaki designed the building and space of the museum himself."]), factCellData(opened: false, title: "Spirited Away", sectionData: ["In 2002, Spirited Away became the first foreign movie to win the Oscar in the Best Animated Feature category. It was actually the highest grossing film of all time in Japan until 2016."])]
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return factTableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if factTableViewData[section].opened == true {
            return factTableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "factCell") else {return UITableViewCell()}
            cell.textLabel?.text = factTableViewData[indexPath.section].title
            return cell
        } else {
            //use diffeernt cell identifier if needed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "factCell") else {return UITableViewCell()}
            cell.textLabel?.text = factTableViewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if factTableViewData[indexPath.section].opened == true {
                factTableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: UITableViewRowAnimation.none)
            } else {
                factTableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: UITableViewRowAnimation.none)
            }
        }

    }
   
}
