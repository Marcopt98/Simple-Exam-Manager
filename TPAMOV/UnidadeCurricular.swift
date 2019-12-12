//
//  UnidadeCurricular.swift
//  TPAMOV
//
//  Created by Marco André Marinho Lopes on 07/12/2018.
//  Copyright © 2018 Marco. All rights reserved.
//

import UIKit
import Foundation

class UnidadeCurricular: NSObject, NSCoding{
    
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
        return "\(nome) Ano - \(ano) Semestre - \(semestre)"
    }
    
    func getDates()->String{
        return "Normal - \(e_normal) | Recurso - \(e_recurso) | Especial - \(e_especial)"
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(ano, forKey: "ano")
        aCoder.encode(semestre, forKey: "semestre")
        aCoder.encode(e_normal, forKey: "e_normal")
        aCoder.encode(e_recurso, forKey: "e_recurso")
        aCoder.encode(e_especial, forKey: "e_especial")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as? String ?? ""
        self.ano = Int(aDecoder.decodeInteger(forKey: "ano"))
        self.semestre = Int(aDecoder.decodeInteger(forKey: "semestre"))
        self.e_normal = aDecoder.decodeObject(forKey: "e_normal") as? String ?? ""
        self.e_recurso = aDecoder.decodeObject(forKey: "e_recurso") as? String ?? ""
        self.e_especial = aDecoder.decodeObject(forKey: "e_especial") as? String ?? ""
    }
    
}
