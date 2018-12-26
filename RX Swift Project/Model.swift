//
//  Model.swift
//  RX Swift Project
//
//  Created by Sahand Raeisi on 12/26/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

public class Car {
    
    public private(set) var image:UIImage!
    public private(set) var name:String!
    
    public init(image:UIImage, name:String) {
        self.image = image
        self.name = name
    }
}
