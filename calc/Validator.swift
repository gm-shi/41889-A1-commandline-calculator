//
//  Validation.swift
//  calc
//
//  Created by KEFAN CHEN on 8/3/2022.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation

class Validator {
    
    func valida (args:[String]) -> Bool {
        if allNumAndOps(args: args) && validExpression(args: args) {
            return true;
        }
        return false;
    }
    
    func allNumAndOps (args:[String]) -> Bool {
        for i in 0...(args.count - 1) {
            if i % 2 == 0{
                let int = Int(args[i])
                if int == nil {
                    return false;
                }
            }
            else {
                if args[i] != "+" && args[i] != "-" && args[i] != "x" && args[i] != "/" && args[i] != "%" {
                    return false;
                }
            }
        }
        return true;
    }
    func validExpression(args:[String]) -> Bool {
        if args.count % 2 == 0 {
            return false;
        }
        return true;
    }
}
