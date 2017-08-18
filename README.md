# Page Controller Without Segue
This repo is here to show you how to create simple app tutorial with easy to maintain architecture. 

![pager controller giph](https://media.giphy.com/media/kDLb3Lug8DN3W/giphy.gif)

To use it, you just need to copy files inside the project and paste into your project.

## What you need to know

### DataModel.swift
This class represents your tutorial model for each page. Modelling it to match with you own model.

There is a Simple Factory to create a fake model inside this project inside `DataModelFactory.swift`.

### DataViewController.swift
This is UI representation of your DataModel class. You can create your design view for your data model.

### ContainerViewController.swift
This View controller contains the pager and your high level design. If you want to share a button between data pages you can design it here.

You can manage Pager view frame here inside func `pagerBounds()`.