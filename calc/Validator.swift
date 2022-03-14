//
//  Validation.swift
//  calc
//
//  Created by Gongming Shi on 8/3/2022.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation
//validation class
class Validator {
    // varify array
    func validate (args:[String]) -> Bool {
        if isAllNumAndOps(args: args) && validExpression(args: args) {   //Check if array is conbined only with numbers and operators,
            return true;                                                //and the number of arguments is even number
        }
        return false;
    }
    //Check if array is conbined only with numbers and operators,
    func isAllNumAndOps (args:[String]) -> Bool {
        for i in 0...(args.count - 1) {                                 //Loop through the array, the index of an argument is even,
            if i % 2 == 0{                                              //check if it can conver to Int
                let int = Int(args[i])
                if int == nil {
                    return false;
                }
            }
            else {                                                      //For the index of an argument is odd, check if it is valid operator
                if args[i] != "+" && args[i] != "-" && args[i] != "x" && args[i] != "/" && args[i] != "%" {
                    return false;
                }
            }
        }
        return true;
    }                                                                   //Check if the args is valid mathmatic expresion in length
    func validExpression(args:[String]) -> Bool {
        if args.count % 2 == 0 {
            return false;
        }
        return true;
    }
}
