//
//  ViewController.swift
//  domaćiRaketa
//
//  Created by Vuk on 5/15/16.
//  Copyright © 2016 User. All rights reserved.///
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        kreirajRaketu()
        kreirajSvemirskiBrod()
        startujRaketu()
        kreirajBum()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var raketa: UIImage?
    var prikazRakete: UIImageView?
    var svemirskiBrod: UIImage?
    var prikazSvemirskogBroda: UIImageView?
    var bum: UIImage?
    var prikazBum: UIImageView?
    
    func kreirajRaketu() {
    
        raketa = UIImage(named:"raketa.png")!
        prikazRakete = UIImageView(image: raketa)
        prikazRakete!.frame = CGRect(x:0,y:100,width:100,height:100)
        prikazRakete!.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(prikazRakete!)
    
    }
    
    func kretanjeRakete() {
        if prikazRakete!.frame.origin.y < view.frame.height-200{ //ovim if-om sam onemugućio da raketa pobegne sa ekrana, već staje nešto iznad dugmeta LEVO
        let stariY = prikazRakete!.frame.origin.y
        prikazRakete!.frame = CGRect(x: 0, y: stariY + 2, width: 100, height: 100)
        }
        // zbog tajmera (u f-ji startujRaketu) koji se odnosi na ovu f-ju kretanjeRakete svakih 0.07 sekundi se raketa pomeri za +2 piksela jer je tako napisan y: stariY + 2
    }
    
    func startujRaketu() {
        
        _ = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(ViewController.kretanjeRakete) , userInfo: nil, repeats: true)
        
        //tajmer se u ovoj varijanti .scheduledTimerWithTimeInterval podešava ovako(vreme tajmera - dakle 0.07 sekundi je okidač, self se odnosi na sebe samog tj na ViewController, selektor se odnosi na f-ju koja će koristiti tajmer[ovo -  #selector(ViewController.kretanjeRakete) može i ovako - Selector("increaseTimer")],nil je za sad po default-u, true zato što hoćemo da se tajmer ponavlja stalno)
        
    }
    
    func kreirajSvemirskiBrod() {
    
        svemirskiBrod = UIImage(named: "leteci tanjir.png")
        prikazSvemirskogBroda = UIImageView(image: svemirskiBrod)
        prikazSvemirskogBroda!.frame = CGRect(x: 300, y: 500, width: 100, height: 100)
        prikazSvemirskogBroda!.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(prikazSvemirskogBroda!)
        
    
    }
    
    func brodLevo() {
    
        let stariXL = prikazSvemirskogBroda!.frame.origin.x
        prikazSvemirskogBroda!.frame = CGRect(x: stariXL - 10, y: 500, width: 100, height: 100)
    }
    
    func brodDesno() {
        
        let stariXD = prikazSvemirskogBroda!.frame.origin.x
        prikazSvemirskogBroda!.frame = CGRect(x: stariXD + 10, y: 500, width: 100, height: 100)
        
    }
    
    @IBAction func levo(_ sender: AnyObject) {
        //ovim ifom ne dam svemirskom brodu da mi beži van ekrana levo
        if prikazSvemirskogBroda!.frame.origin.x > 0{
            brodLevo()
        }
        
    }
    @IBAction func desno(_ sender: AnyObject) {
        //ovim ifom ne dam svemirskom brodu da mi beži van ekrana desno
        if prikazSvemirskogBroda!.frame.origin.x < view.frame.width-100{
        brodDesno()
        }
    }
    
    func kreirajBum() {
        if //prikazSvemirskogBroda!.frame.origin.x > 0   && 
            prikazSvemirskogBroda!.frame.origin.x < 120 && prikazRakete!.frame.origin.y > 480 //&& prikazRakete!.frame.origin.y < 600
            {
            bum = UIImage(named:"boom.jpg")
            prikazBum!.frame = CGRect(x: 0 , y: 480, width: 130, height: 130)
            prikazBum!.contentMode = UIViewContentMode.scaleAspectFit
            view.addSubview(prikazBum!)
            
        }
    }
    

}

