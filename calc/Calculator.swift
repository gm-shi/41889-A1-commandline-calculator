//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation


class Calculator {
    var position: Int;
    var currentResult: Int;
    init (){
        currentResult = 0;
        position = 0;
    };
    func calculate(_ firstNumber: Int,_ op: String,_ secondNumber: Int) -> Int {
        var result = 0;
        switch (op){
        case "x":
            result = firstNumber * secondNumber; break;
        case "/":
            result = firstNumber / secondNumber; break;
        case "%":
            result = firstNumber % secondNumber; break;
        case "+":
            result = firstNumber + secondNumber; break;
        case "-":
            result = firstNumber - secondNumber; break;
        default:
            break;
        }
        return result;
    }
    
    func calc (args:[String]) -> Int {
        var newArgs = args;
        if args.count == 1 {
            currentResult = Int(args[0]) ?? 0;
        }
        while hasPriorityOperation(args: newArgs){
            if newArgs.count == 3 {
                return calculate(Int(newArgs[0]) ?? 0, newArgs[1], Int(newArgs[2]) ?? 0);
            }
            newArgs = doPriorityOperation(args: newArgs);
        }
        if newArgs.count >= 3 {
            currentResult = calculate(Int(newArgs[0]) ?? 0, newArgs[1], Int(newArgs[2]) ?? 0);
            position = 2;
        }
        while position+2 <= newArgs.count && newArgs.count >= 3{
                position += 1;
                let op = newArgs[position];
                position += 1;
                let secondNum = Int(newArgs[position]) ?? 0;
                currentResult = calculate(currentResult, op, secondNum);
            }
        return currentResult;
    }
    
    func doPriorityOperation(args:[String]) -> [String]{
        var result: Int;
        let opPosition = findPriorityOperation(args: args) ?? 0;
        result = calculate(Int(args[opPosition-1]) ?? 0, args[opPosition] , Int(args[opPosition+1]) ?? 0);
        if opPosition == 1{
            return ["\(result)"] + Array(args[opPosition + 2...args.count - 1]);
        }
        else if opPosition > 1 && opPosition < args.count - 2{
            return Array(args[0...opPosition - 2]) + ["\(result)"] + Array(args[opPosition + 2...args.count - 1]);
        }
        else {
            return Array(args[0...opPosition - 2]) + ["\(result)"];
        }

    }
    func hasPriorityOperation (args:[String]) -> Bool {
        for arg in args {
            if isPriorityOperator(arg: arg){
                return true;
            }
        }
        return false;
    }

    func findPriorityOperation (args:[String]) -> Int? {
        for i in 0...args.count - 1{
            if isPriorityOperator(arg: args[i])
            {
                return i;
            }
        }
        return nil;
    }



    func isPriorityOperator(arg:String) -> Bool {
        let op = arg;
        if(op == "x" || op == "/" || op == "%") {
            return true;

        }
        return false;
    }

}
