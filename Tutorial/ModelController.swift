//
//  ModelController.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 13/06/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import UIKit

protocol TutorialPageViewControllerDelegate: class {
  func tutorialPageViewController(didUpdatePageCount count: Int)
  func tutorialPageViewController(didUpdatePageIndex index: Int)
}

class ModelController: NSObject {
  
  var pageData: [DataModel] = []
  weak var delegate: TutorialPageViewControllerDelegate?
  
  func numebrOfController() {
    self.delegate?.tutorialPageViewController(didUpdatePageCount: pageData.count)
  }
  
  /// Return the data view controller for the given index.
  func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard?) -> DataViewController? {
    if (self.pageData.count == 0) || (index >= self.pageData.count) {
      return nil
    }
    // Create a new view controller and pass suitable data.
    return self.dataController(at: index, with: storyboard)
  }
  
  // MARK: private funcs
  private func dataController(at index: Int, with storyboard: UIStoryboard?) -> DataViewController? {
    let dataViewController = storyboard?.instantiateViewController(withIdentifier: VCNames.dataVC) as? DataViewController
    dataViewController?.dataObject = self.pageData[safe: index]
    return dataViewController
  }
  
  /// Return the index of the given data view controller.
  private func index(of viewController: DataViewController?) -> Int {
    guard let dataObject = viewController?.dataObject else { return NSNotFound }
    return pageData.index(of: dataObject) ?? NSNotFound
  }
}

extension ModelController: UIPageViewControllerDataSource {
  // MARK: - Page View Controller Data Source
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return returnViewController(viewController: viewController,
                                condition: { index in return (index == 0) || (index == NSNotFound) },
                                after: false)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return returnViewController(viewController: viewController,
                                condition: { index in return (index == NSNotFound) },
                                after: true)
  }
  
  private func returnViewController(viewController: UIViewController, condition: (_ index: Int) -> Bool, after: Bool) -> UIViewController? {
    var index = self.index(of: viewController as? DataViewController)
    self.delegate?.tutorialPageViewController(didUpdatePageIndex: index)
    if condition(index) { return nil }
    index = after ? index + 1 : index - 1
    return self.viewControllerAtIndex(index, storyboard: viewController.storyboard)
  }
}
