//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments;

args.removeFirst(); // remove the name of the program

let validator = Validator(); //Initialize a Validator object
//Validate args is valid mathmatic expression
if validator.valida(args: args){
    let calculator = Calculator(); // Initialize a Calculator object
    let result = calculator.calculate(args: args); //Do calculation
    print(result);
}
//if invalid, exit
else{
    exit(1);
}


