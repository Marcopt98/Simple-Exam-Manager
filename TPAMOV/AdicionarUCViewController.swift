//
//  AdicionarUCViewController.swift
//  TPAMOV
//
//  Created by Marco André Marinho Lopes on 17/11/2018.
//  Copyright © 2018 Marco. All rights reserved.
//

import UIKit

class AdicionarUCViewController: UIViewController {
    
    @IBOutlet var TextFieldNomeUC: UITextField!
    @IBOutlet var TextFieldAno: UITextField!
    @IBOutlet var TextFieldSemestre: UITextField!
    
    @IBOutlet var TextFieldDateNormal: UITextField!
    @IBOutlet var TextFieldDateRecurso: UITextField!
    @IBOutlet var TextFieldDateEspecial: UITextField!
    
    @IBOutlet var AdicionarRoundButton: UIButton!
    
    
    
    
    private var datePickerNormal: UIDatePicker?
    private var datePickerRecurso: UIDatePicker?
    private var datePickerEspecial: UIDatePicker?
    
    @IBAction func AdicionarUC(_ sender: Any) {
        
        
        let nomeUC:String = TextFieldNomeUC.text!
        let ano: Int? = Int(TextFieldAno.text!)
        let semestre: Int? = Int(TextFieldSemestre.text!)
        let normal: String = TextFieldDateNormal.text!
        let recurso: String = TextFieldDateRecurso.text!
        let especial: String = TextFieldDateEspecial.text!
        
        let uc = UnidadeCurricular(nome: nomeUC,ano: ano!,semestre: semestre!,e_normal: normal,e_recurso: recurso,e_especial: especial)
        
        arrayUnidadesCurriculares.append(uc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        AdicionarRoundButton.layer.cornerRadius = 12.0
        AdicionarRoundButton.layer.masksToBounds = true
        
        datePickerNormal = UIDatePicker()
        datePickerRecurso = UIDatePicker()
        datePickerEspecial = UIDatePicker()
        
        
        datePickerNormal?.datePickerMode = .date
        datePickerRecurso?.datePickerMode = .date
        datePickerEspecial?.datePickerMode = .date
        
        
        datePickerNormal?.addTarget(self, action: #selector(AdicionarUCViewController.dateChangedNormal(datePicker:)), for: .valueChanged)
        datePickerRecurso?.addTarget(self, action: #selector(AdicionarUCViewController.dateChangedRecurso(datePicker:)), for: .valueChanged)
        datePickerEspecial?.addTarget(self, action: #selector(AdicionarUCViewController.dateChangedEspecial(datePicker:)), for: .valueChanged)
        
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AdicionarUCViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        TextFieldDateNormal.inputView = datePickerNormal
        TextFieldDateRecurso.inputView = datePickerRecurso
        TextFieldDateEspecial.inputView = datePickerEspecial
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true);
    }
    
    @objc func dateChangedNormal(datePicker: UIDatePicker){
         let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        TextFieldDateNormal.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func dateChangedRecurso(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        TextFieldDateRecurso.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func dateChangedEspecial(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        TextFieldDateEspecial.text = dateFormatter.string(from: datePicker.date)
    }
    
}
