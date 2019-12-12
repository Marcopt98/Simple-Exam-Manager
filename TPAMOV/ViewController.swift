//
//  ViewController.swift
//  TPAMOV
//
//  Created by Marco André Marinho Lopes on 17/11/2018.
//  Copyright © 2018 Marco. All rights reserved.
//

import UIKit

//var arrayUnidadesCurriculares = [UnidadeCurricular]()

class ViewController: UIViewController {
    
    
    @IBOutlet var Round_image: UIImageView!
    @IBOutlet var AddUC_Button: UIButton!
    @IBOutlet weak var ManageExame_Button: UIButton!
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func AddUCViewAction(_ sender: Any) {
        self.performSegue(withIdentifier: "AdicionarUCSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadPlaces();
        
        AddUC_Button.layer.cornerRadius = 12.0;
        AddUC_Button.layer.masksToBounds = true;
        ManageExame_Button.layer.cornerRadius = 12.0;
        ManageExame_Button.layer.masksToBounds = true;
        
        Round_image.layer.cornerRadius = 12.0;
        Round_image.layer.masksToBounds = true;
    
    
    }
    
    
    
    func loadPlaces() {
        guard let uc = UserDefaults.standard.object(forKey: "ucs") as? NSData else {
            print("'ucs' not found in UserDefaults")
            return
        }
        
        guard let ucarray = NSKeyedUnarchiver.unarchiveObject(with: uc as Data) as? [UnidadeCurricular] else {
            print("Could not unarchive from placesData")
            return
        }
        
        self.app.lstUnidadesCurriculares = ucarray;
    }


}

