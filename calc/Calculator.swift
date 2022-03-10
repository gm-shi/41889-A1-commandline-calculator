//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation


class Calculator {
    // Do calculation, returns the result as Integer
    func calculate(args:[String]) -> Int {
        var result = 0;                                     //Stores the result of culculation
        var opPosition: Int;                                //The operator position
        var currentPosition = 0;                            //Current osisiton of calculation process
        
        if args.count == 1 {                                //Return the number, if only one arg
            return Int(args[0]) ?? 0;
        }
        //Return a String array with only "+" and "-" operation
        while hasPriorityOperation(args: args) {             //Do while loop if it has priority operation
            opPosition = findPriorityOperation(args: args) ?? 0; //Find the first priority operator
            result = pairCalculation(Int(args[opPosition-1]) ?? 0, args[opPosition] , Int(args[opPosition+1]) ?? 0);
            if args.count == 3 {
                return result;
            }
            if opPosition == 1 {
                return calculate(args: ["\(result)"] + Array(args[opPosition + 2...args.count - 1])); //Handle the priority operator is the left of the arry
            }                                                                                         //And do recursion
            else if opPosition > 1 && opPosition < args.count - 2 {                                    //Handle the priority operator in the middle of the array
                return calculate(args: Array(args[0...opPosition - 2]) + ["\(result)"] + Array(args[opPosition + 2...args.count - 1]));
            }
            else {                                                                                    //Handle the priority operator in the right of the array
                return calculate(args: Array(args[0...opPosition - 2]) + ["\(result)"]);
            }
        }
        //Do "+" and "-" operation
        if args.count >= 3 {
            result = pairCalculation(Int(args[0]) ?? 0, args[1], Int(args[2]) ?? 0);
            currentPosition = 2;
        }
        while currentPosition+2 <= args.count && args.count >= 3 {
            currentPosition  += 1;
            let op = args[currentPosition];
            currentPosition  += 1;
            let secondNum = Int(args[currentPosition]) ?? 0;
            result = pairCalculation(result, op, secondNum);
        }
        return result;

    }
    //Check if the array has priority operation
    func hasPriorityOperation (args:[String]) -> Bool {
        for arg in args {
            if isPriorityOperator(arg: arg) {
                return true;
            }
        }
        return false;
    }
    //Return the index of the priority operator
    func findPriorityOperation (args:[String]) -> Int? {
        for i in 0...args.count - 1{
            if isPriorityOperator(arg: args[i]) {
                return i;
            }
        }
        return nil;
    }
    //Check if the arg:String is priority operator
    func isPriorityOperator(arg:String) -> Bool {
        let op = arg;
        if op == "x" || op == "/" || op == "%" {
            return true;
        }
        return false;
    }
    //Calculate with a pair of numbers and an operator
    func pairCalculation(_ firstNumber: Int,_ op: String,_ secondNumber: Int) -> Int {
        var result = 0;
        switch op {
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
