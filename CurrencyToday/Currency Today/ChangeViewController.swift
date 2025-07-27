//
//  ChangeViewController.swift
//  Currency Today
//
//  Created by Student on 18.07.25.
//

import UIKit

class ChangeOption {
    var name:String
    var backgroundimage: UIImage
    var backgroundcolor: UIColor
    var api: String
    
    init(name: String, backgroundimage: UIImage, backgroundcolor: UIColor, api: String) {
        self.name = name
        self.backgroundimage = backgroundimage
        self.backgroundcolor = backgroundcolor
        self.api = api
    }
}

class ChangeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var models = [ChangeOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChangeTableViewCell.self, forCellReuseIdentifier: ChangeTableViewCell.identifier)
        configure ()
        }
    
    func configure (){
        models.append(contentsOf: [
            ChangeOption (name: "AMD", backgroundimage: UIImage(named: "arm")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/AMD"),
            ChangeOption (name: "USD", backgroundimage: UIImage(named: "use")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/USD"),
            ChangeOption(name: "EUR", backgroundimage: UIImage(named: "eu")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/EUR"),
            ChangeOption (name: "RUB", backgroundimage: UIImage(named: "ru")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/RUB"),
            ChangeOption (name: "CNY", backgroundimage: UIImage(named: "cin")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/CNY"),
            ChangeOption (name: "INR", backgroundimage: UIImage(named: "in")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/INR"),
            ChangeOption (name: "CAD", backgroundimage: UIImage(named: "ka")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/CAD"),
            ChangeOption (name: "TRY", backgroundimage: UIImage(named: "tu")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/TRY"),
            ChangeOption (name: "GEL", backgroundimage: UIImage(named: "go")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/GEL"),
            ChangeOption (name: "KRW", backgroundimage: UIImage(named: "Kor")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/KRW"),
            ChangeOption (name: "BRL", backgroundimage: UIImage(named: "Br")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/BRL"),
            ChangeOption (name: "JOD", backgroundimage: UIImage(named: "jor")!, backgroundcolor: .white, api: "https://open.er-api.com/v6/latest/JOD")
            
        ])
        
    }
    
    
    
    @IBAction func home(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as?  HomeViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
    @IBAction func settings(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as?  SettingsViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
    
}

extension ChangeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChangeTableViewCell.identifier, for: indexPath)as? ChangeTableViewCell
        else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if models[indexPath.item].name != "" {
            let vc  =
        storyboard?.instantiateViewController(withIdentifier: "ConvertViewController") as? ConvertViewController
            vc?.ap = models[indexPath.item].api
            vc?.text = models[indexPath.item].name
            self.present(vc!, animated: true)
        }
    }
}
