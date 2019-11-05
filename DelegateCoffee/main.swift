//
//  main.swift
//  DelegateCoffee
//
//  Created by Fauzi Achmad Haruna on 05/11/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import Foundation

//Delegation is a design pattern that enables a class to hand off (or “delegate”) some of its responsibilities to an instance of another class.
//Delegates Paradigma Programming : mendelegasikan task/method ke object lain
//Pada kasus ini akan membuat program untuk menyajikan coffee ke pelanggan, prosesnya terbagi ada yang menyeduh dan meracik kopi, ada yang menyajikan kopi.

///abstraksi object coffee
struct Coffee {
    var flavor: [String] = []
    var hot: Bool = true
}

///class ini memiliki fungsi untuk membuat coffee
class Barista {
    var delegateCoffee: CoffeeDelegate?
    
    func makeCoffee(){
        ///encapsulasi struct Coffee dalam variabel coffee
        var coffee = Coffee()
        ///mendefinisikan object coffee dengan properti dari Coffee()
        coffee.flavor = ["Latte"]
        coffee.hot = true
        ///
        ///
        delegateCoffee?.coffeeWasReady(coffee)
    }
    
}
///protocol ini untuk membuat fungsi delegate coffeeWasReady() untuk diimplementasikan oleh Barista
protocol CoffeeDelegate {
    func coffeeWasReady(_ coffee: Coffee)
}
class CoffeeShop: CoffeeDelegate {
    func coffeeWasReady(_ coffee: Coffee) {
        if(coffee.hot == true){
            print("the coffee with \(coffee.flavor) serve in hot")
        }
        print("the coffee with \(coffee.flavor) serve in cold")
    }
}
///instansiasi object coffeeShop dari class CoffeeShop sehingga sekarang coffeeShop memiliki atribut dan properti dari class CoffeeShop
let coffeeShop = CoffeeShop()
let baristaCoffee = Barista()
///coffeeShop menjadi delegasi dari baristaCoffee
baristaCoffee.delegateCoffee = coffeeShop
///ketika baristaCoffee membuatCoffee akan di serahkan ke coffeeShop
baristaCoffee.makeCoffee()

