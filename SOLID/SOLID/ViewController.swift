//
//  ViewController.swift
//  SOLID
//
//  Created by Arya Deshmukh on 20/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let admin = Admin()
        admin.tasks()
        
        let buy = Groceries()
        buy.shopping()
        
        
        var cash = ByCash(amount:78)
        cash.pay()
        var online = Online(amount:80)
        online.pay()
        var pay1 = Payment()
        cash =  pay1
         
        cash.pay()
        
        
        
        let phone1 = SmartPhone()
        print(phone1.clickPhotos())
        
        
        let upi = UPI(amount: 500)
        let payment =  OnlinePayment(methods: upi)
        payment.makePayment(amount: 80.09)
        
    }


}


// Single Responsibility

class Admin {
    
    var add : Add
    var delete : Delete
    var edit : Edit

    init(add : Add = Add(), delete : Delete = Delete(), edit : Edit = Edit()){
        self.add = add
        self.delete = delete
        self.edit = edit
    }
    func tasks(){
        //add
        print(add.addItmes())
        
        //delete
        print(delete.deleteItmes())
        
        //edit
        print(edit.editItmes())
    }
}

class Add {

    func addItmes()  {
        print("Itmes added ")
    }
}

class Delete {
    func deleteItmes() {
        print("Itmes deleted")
    }
}

class Edit{
    func editItmes()  {
        print("Itmes edited")
    }
}



//Open and close
//Open for extension
//Close for modification

protocol addBucket {
    func addToBucket()
}

class Groceries {
    
    func shopping(){
        let groceries : [addBucket] = [Fruits(name : "Apple",price:60),Fruits(name : "Banana",price:70),Fruits(name : "Orange",price:60), Vegetables(name : "Potato",price:56),Vegetables(name : "Spinach",price:90)];
        
        groceries.forEach { info in
            info.addToBucket()
            
        }
    }
}

class Fruits : addBucket {
    let name : String
    let price : Int
    
    init(name : String, price : Int){
        self.name = name
        self.price = price
    }
    
    func addToBucket(){
        print("Fruit \(name) having \(price) is added")
    }
}

class Vegetables : addBucket{
    let name : String
    let price : Int
    
    init(name : String, price : Int){
        self.name = name
        self.price = price
    }
    
    func addToBucket(){
        print("Vegetable \(name) having \(price) is added")
    }
}




//LSP
class Payment {
    func pay()
    {
        print("Make payment")
    }
    
}

class ByCash :Payment {
    let amount : Double
    init(amount: Double) {
        self.amount = amount
    }
    override func pay(){
        print("Payment done through cash of amount \(amount)")
    }
}
class Online  :Payment {
    let amount : Double
    init(amount: Double) {
        self.amount = amount
    }
    override func pay(){
        print("Payment done through online mode of amount \(amount)")
    }
}

//Interface Segregation Principle (ISP):

protocol Audio {
    func playAudio()
  
}

protocol Video {
    func playVideo()
  
}

protocol Camera {
    func clickPhotos()
}

typealias allInOne = Audio & Video & Camera

class SmartPhone: allInOne{
    func playVideo() {
        print("Video functionality is provided")
    }
    
    func clickPhotos() {
        print("Camera functionality is provided")
    }
    
    func playAudio(){
        print("Audio functionality is provided")
    }
}

class NormalPhone: Audio,Video {
    func playAudio() {
        print("Audio functionality is provided")
    }
    
    func playVideo() {
        print("Audio functionality is provided")
    }
}


//Dependency Inversion
//High level module should not depend on low level module
//Both should depend on protocol


protocol PaymentMethods{
    func pay(amount: Double)
}
class OnlinePayment {
    
    var methods: PaymentMethods
    init(methods:  PaymentMethods) {
        self.methods = methods
    }
    func makePayment(amount: Double){
        methods.pay(amount: amount)
    }
    
}

class UPI:PaymentMethods {
    
    var amount: Double
    init(amount: Double) {
        self.amount = amount
    }
    func pay(amount: Double){
        print("Payment is done of ruppes \(amount) through UPI")
    }
}

class DebitCard:PaymentMethods {
    var amount: Double
    init(amount: Double) {
        self.amount = amount
    }
    func pay(amount: Double){
        print("Payment is done of ruppes \(amount) through DebitCard")
    }
}

class CreditCard: PaymentMethods{
    var amount: Double
    init(amount: Double) {
        self.amount = amount
    }
    func pay(amount: Double){
        print("Payment is done of ruppes \(amount) through CreditCard")
    }
}



