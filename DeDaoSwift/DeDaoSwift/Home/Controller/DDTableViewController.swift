//
//  DDTableViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/2.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
class DDTableViewController: DDBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页"
        
        
        let dic = DDTool.getDictionaryWithPatch(fileName:"homeJsonData.json") as? Dictionary<String, Any>
        
        
        var array  = Array<String>()
        
        
        
        
        let  model = Mapper<DDHomeModel>().map(JSON: dic!)
        
        print(model?.c?.data?.slider?.list?[0].m_title ?? "nil")
        
        print(model?.c?.data?.freeAudio?.list?[0].mp3_play_url ?? "nil")
            
        
        for  list in (model?.c?.data?.slider?.list)! {
            array.append(list.m_img)
            print(list.m_img)
            
        }
        let banner = SDCycleScrollView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 140), delegate: self, placeholderImage: UIImage(named: ""))
        banner?.imageURLStringsGroup = array
        banner?.autoScrollTimeInterval = 4
        banner?.backgroundColor  = UIColor.red
        view.addSubview(banner!)
        
        
        

        
        
    }
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        return cell
    }
   
  
}

