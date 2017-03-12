//
//  DDNavigationProtocol.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

protocol DDNavigationProtocol{
 
    func pushViewModel(viewModel : DDBaseViewModel,_ animated : Bool)
    func popViewModelAnimated(_ animated : Bool)
    func popToRootViewModelAnimated(_ animated : Bool)
    func presentViewModel(viewModel :DDBaseViewModel, _ animated : Bool,completion:()->())
    func dismissViewModelAnimated(_ animated : Bool,completion:()->())
    func resetRootViewModel(viewModel :DDBaseViewModel)
}

