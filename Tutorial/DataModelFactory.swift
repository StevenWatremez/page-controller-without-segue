//
//  DataModelFactory.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 18/08/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import Foundation

struct DateModelFactory {
  static func fakeModel() -> ModelController {
    let modelController = ModelController()
    let firstDatamodel = DataModel(title: "page 1")
    let secondDatamodel = DataModel(title: "page 2")
    let thirdDatamodel = DataModel(title: "page 3")
    modelController.pageData = [firstDatamodel, secondDatamodel,thirdDatamodel]
    return modelController
  }
}
