//
//  ViewController.swift
//  TPAMOV
//
//  Created by Marco André Marinho Lopes on 17/11/2018.
//  Copyright © 2018 Marco. All rights reserved.
//

import UIKit

class UnidadeCurricular{
    var nome:String
    var ano:Int
    var semestre:Int
    var e_normal:String
    var e_recurso:String
    var e_especial:String
    
    init(nome:String, ano:Int, semestre:Int, e_normal:String, e_recurso:String, e_especial:String) {
        
        self.nome = nome
        self.ano = ano
        self.semestre = semestre
        self.e_normal = e_normal
        self.e_recurso = e_recurso
        self.e_especial = e_especial
    }
    
    func getName()->String{
        return "Nome da UC \(nome)"
    }
    
}

var arrayUnidadesCurriculares = [UnidadeCurricular]()

class ViewController: UIViewController {
    
    
    @IBOutlet var Round_image: UIImageView!
    @IBOutlet var AddUC_Button: UIButton!
    @IBOutlet var ManageExame_Button: UIButton!
    
    @IBAction func AddUCViewAction(_ sender: Any) {
        self.performSegue(withIdentifier: "AdicionarUCSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AddUC_Button.layer.cornerRadius = 12.0;
        AddUC_Button.layer.masksToBounds = true;
        ManageExame_Button.layer.cornerRadius = 12.0;
        ManageExame_Button.layer.masksToBounds = true;
        
        Round_image.layer.cornerRadius = 12.0;
        Round_image.layer.masksToBounds = true;
    
    
    }


}

