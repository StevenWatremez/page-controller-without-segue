//
//  DataModel.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 18/08/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import Foundation

struct DataModel {
  let title: String
}

extension DataModel: Equatable {
  static func ==(lhs: DataModel, rhs: DataModel) -> Bool {
    return lhs.title == rhs.title
  }
}

extension DataModel: CustomStringConvertible {
  var description: String {
    return "dataModel: title = \(self.title)"
  }
}
