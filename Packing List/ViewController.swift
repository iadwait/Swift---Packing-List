//
//  ViewController.swift
//  Packing List
//
//  Created by Adwait Barkale on 14/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

struct DataModel{
    
    var name: String
    var image: UIImage
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet var menu: UIView!
    @IBOutlet var menuHeight: NSLayoutConstraint!
    @IBOutlet var lblPackingListHeight: NSLayoutConstraint!
    @IBOutlet var btnPlusHeight: NSLayoutConstraint!
    @IBOutlet var imagesStackView: UIStackView!
    @IBOutlet var lblPackingList: UILabel!
    @IBOutlet var tablePackingList: UITableView!
    
    var isOpen = false
    
    var arrNames = [
        "Pencil",
        "Sun",
        "Tray",
        "Keyboard",
        "Phone"
    ]
    
    var arrImages = [
        "pencil.circle",
        "sun.max.fill",
        "tray.full",
        "keyboard",
        "phone"
    ]
    
    var arrAddedElement:[DataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuHeight.constant = 85
        lblPackingListHeight.constant = 35
        imagesStackView.isHidden = true
        
        tablePackingList.delegate = self
        tablePackingList.dataSource = self
        
        tablePackingList.backgroundColor = .clear
        
        arrAddedElement.append(DataModel(name: "Pencil", image: UIImage(systemName: "pencil.circle")!))
        tablePackingList.reloadData()
    }
    
    @IBAction func btnShowTapped(_ sender: UIButton) {
        
        showHideMenu()
        
    }
    
    func showHideMenu()
    {
        isOpen = !isOpen
        menuHeight.constant = isOpen ? 200 : 85
        lblPackingListHeight.constant = isOpen ? 100 : 35
        btnPlusHeight.constant = isOpen ? 100 : 30
        
        if isOpen{
            self.lblPackingList.text = "Select Item !!!"
            self.imagesStackView.isHidden = false
        }else {
            self.lblPackingList.text = "Packing List"
            self.imagesStackView.isHidden = true
        }
        
        UIView.animate(withDuration: 0.33, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAddedElement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tablePackingList.dequeueReusableCell(withIdentifier: "PackingViewCell") as! PackingViewCell
        let data = arrAddedElement[indexPath.row]
        cell.img.image = data.image
        cell.lblTitle.text = data.name
        cell.backgroundColor = .tertiarySystemBackground
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @IBAction func btnPencilTapped(_ sender: UIButton) {
        let name = arrNames[0]
        let image = UIImage(systemName: arrImages[0])
        var isAdded = false
        
        for item in arrAddedElement
        {
            if name == item.name
            {
                isAdded = true
            }
        }
        
        if isAdded{
            showAlert(title: name)
        }else {
            arrAddedElement.append(DataModel(name: name, image: image!))
            tablePackingList.reloadData()
        }
        showHideMenu()
    }
    
    @IBAction func btnSunTapped(_ sender: UIButton) {
        let name = arrNames[1]
        let image = UIImage(systemName: arrImages[1])
        var isAdded = false
        
        for item in arrAddedElement
        {
            if name == item.name
            {
                isAdded = true
            }
        }
        
        if isAdded{
            showAlert(title: name)
        }else {
            arrAddedElement.append(DataModel(name: name, image: image!))
            tablePackingList.reloadData()
        }
        showHideMenu()
    }
    
    @IBAction func btnTrayTapped(_ sender: UIButton) {
        let name = arrNames[2]
        let image = UIImage(systemName: arrImages[2])
        
        var isAdded = false
        
        for item in arrAddedElement
        {
            if name == item.name
            {
                isAdded = true
            }
        }
        
        if isAdded{
            showAlert(title: name)
        }else {
            arrAddedElement.append(DataModel(name: name, image: image!))
            tablePackingList.reloadData()
        }
        
        
        showHideMenu()
    }
    
    @IBAction func btnKeyboardTapped(_ sender: UIButton) {
        let name = arrNames[3]
        let image = UIImage(systemName: arrImages[3])
        var isAdded = false
        
        for item in arrAddedElement
        {
            if name == item.name
            {
                isAdded = true
            }
        }
        
        if isAdded{
            showAlert(title: name)
        }else {
            arrAddedElement.append(DataModel(name: name, image: image!))
            tablePackingList.reloadData()
        }
        showHideMenu()
    }
    
    @IBAction func btnPhoneTapped(_ sender: UIButton) {
        let name = arrNames[4]
        let image = UIImage(systemName: arrImages[4])
        var isAdded = false
        
        for item in arrAddedElement
        {
            if name == item.name
            {
                isAdded = true
            }
        }
        
        if isAdded{
            showAlert(title: name)
        }else {
            arrAddedElement.append(DataModel(name: name, image: image!))
            tablePackingList.reloadData()
        }
        showHideMenu()
    }
    
    
    func showAlert(title: String)
    {
        let alert = UIAlertController(title: "Already Added", message: "\(title) is Already Added", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(dismissAction)
        
        self.present(alert,animated: true)
    }
}

