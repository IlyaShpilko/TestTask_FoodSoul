//
//  ObjcFilterType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import Foundation

@objc enum ObjcFilterType: Int {
    @objc(ObjcFilterTypeWeRecommend) case weRecommend
    @objc(ObjcFilterTypeFavorite)case favorite
    @objc(ObjcFilterTypePopular)case popular
    @objc(ObjcFilterTypeJapaneseFood)case japaneseFood
}
