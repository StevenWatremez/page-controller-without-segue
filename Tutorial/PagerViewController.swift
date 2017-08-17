//
//  RootViewController.swift
//  Tutorial
//
//  Created by Steven_WATREMEZ on 13/06/2017.
//  Copyright © 2017 Niji. All rights reserved.
//

import UIKit

class PagerViewController: UIViewController {

  var pageVC: UIPageViewController?
  weak var delegate: TutorialPageViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupSubviews()
  }

  var modelController: ModelController?
  
  private func setupSubviews() {
    self.setupPageViewController()
    self.setupControllers()
    self.setupPageControllerBounds()
  }
  
  // Configure the page view controller and add it as a child view controller.
  private func setupPageViewController() {
    self.pageVC = UIPageViewController(transitionStyle: .scroll,
                                                   navigationOrientation: .horizontal,
                                                   options: nil)
    self.pageVC?.dataSource = self.modelController
    self.modelController?.delegate = self
    self.modelController?.numebrOfController()
    if let pageViewController = self.pageVC {
      self.addChildViewController(pageViewController)
      self.view.addSubview(pageViewController.view)
    }
  }
  
  private func setupControllers() {
    if let storyboard = self.storyboard,
      let startingViewController = self.modelController?.viewControllerAtIndex(0, storyboard: storyboard) {
      let viewControllers = [startingViewController]
      self.pageVC?.setViewControllers(viewControllers,
                                                  direction: .forward,
                                                  animated: false,
                                                  completion: {done in })
    }
  }
  
  // Set the page view controller's bounds using an inset rect
  // so that self's view is visible around the edges of the pages.
  private func setupPageControllerBounds() {
    var pageViewRect = self.view.bounds
    if UIDevice.current.userInterfaceIdiom == .pad {
      pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
    }
    self.pageVC?.view.frame = pageViewRect
    self.pageVC?.didMove(toParentViewController: self)
  }
}

extension PagerViewController: TutorialPageViewControllerDelegate {
  func tutorialPageViewController(didUpdatePageCount count: Int) {
    self.delegate?.tutorialPageViewController(didUpdatePageCount: count)
  }
  
  func tutorialPageViewController(didUpdatePageIndex index: Int) {
    self.delegate?.tutorialPageViewController(didUpdatePageIndex: index)
  }
}
