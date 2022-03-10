//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation


class Calculator {
    
    func calculate(args:[String]) -> Int{
        var result = 0;
        var opPosition: Int;
        var currentPosition = 0;
        
        if args.count == 1 {
            return Int(args[0]) ?? 0;
        }
        while hasPriorityOperation(args: args){
            opPosition = findPriorityOperation(args: args) ?? 0;
            result = pairCalculate(Int(args[opPosition-1]) ?? 0, args[opPosition] , Int(args[opPosition+1]) ?? 0);
            if args.count == 3 {
                return result;
            }
            if opPosition == 1{
                return doCalculation(args: ["\(result)"] + Array(args[opPosition + 2...args.count - 1]));
            }
            else if opPosition > 1 && opPosition < args.count - 2{
                return doCalculation(args: Array(args[0...opPosition - 2]) + ["\(result)"] + Array(args[opPosition + 2...args.count - 1]));
            }
            else {
                return doCalculation(args: Array(args[0...opPosition - 2]) + ["\(result)"]);
            }
        }
        if args.count >= 3 {
            result = pairCalculate(Int(args[0]) ?? 0, args[1], Int(args[2]) ?? 0);
            currentPosition = 2;
        }
        while currentPosition+2 <= args.count && args.count >= 3{
            currentPosition  += 1;
                let op = args[currentPosition];
                currentPosition  += 1;
                let secondNum = Int(args[currentPosition]) ?? 0;
                result = pairCalculate(result, op, secondNum);
            }
        return result;

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
    
    func pairCalculate(_ firstNumber: Int,_ op: String,_ secondNumber: Int) -> Int {
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

}
