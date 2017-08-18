//
//  RootViewController.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 13/06/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import UIKit

class PagerViewController: UIPageViewController {
  
  weak var viewControllerDelegate: TutorialPageViewControllerDelegate?
  var modelController: ModelController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupSubviews()
  }

  private func setupSubviews() {
    self.setupPageViewController()
    self.setupControllers()
  }
  
  /// Configure the page view controller and add it as a child view controller.
  private func setupPageViewController() {
    self.dataSource = self.modelController
    self.modelController?.delegate = self
    self.modelController?.numebrOfController()
  }
  
  private func setupControllers() {
    if let storyboard = self.storyboard,
      let startingViewController = self.modelController?.viewControllerAtIndex(0, storyboard: storyboard) {
      let viewControllers = [startingViewController]
      self.setViewControllers(viewControllers,
                              direction: .forward,
                              animated: false,
                              completion: {done in })
    }
  }
}

extension PagerViewController: TutorialPageViewControllerDelegate {
  func tutorialPageViewController(didUpdatePageCount count: Int) {
    self.viewControllerDelegate?.tutorialPageViewController(didUpdatePageCount: count)
  }
  
  func tutorialPageViewController(didUpdatePageIndex index: Int) {
    self.viewControllerDelegate?.tutorialPageViewController(didUpdatePageIndex: index)
  }
}
