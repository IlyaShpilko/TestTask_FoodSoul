//
//  LabelType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/5/24.
//

import Foundation

@objc enum LabelFactoryType: Int {
    @objc(TitleLabel) case title
    @objc(DefaultLabel) case `default`
    @objc(DescriptionLabel) case description
}
