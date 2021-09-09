//
//  Collection+safe.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 13/06/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import Foundation

public extension Collection {
  private func distance(from startIndex: Index) -> Int {
    return distance(from: startIndex, to: self.endIndex)
  }
  
  private func distance(to endIndex: Index) -> Int {
    return distance(from: self.startIndex, to: endIndex)
  }
  
  subscript(safe index: Index) -> Iterator.Element? {
    if distance(to: index) >= 0 && distance(from: index) > 0 {
      return self[index]
    }
    return nil
  }
  
  subscript(safe bounds: Range<Index>) -> SubSequence? {
    if distance(to: bounds.lowerBound) >= 0 && distance(from: bounds.upperBound) >= 0 {
      return self[bounds]
    }
    return nil
  }
  
  subscript(safe bounds: ClosedRange<Index>) -> SubSequence? {
    if distance(to: bounds.lowerBound) >= 0 && distance(from: bounds.upperBound) > 0 {
      return self[bounds]
    }
    return nil
  }
}
