//
//  PromotionModel.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import UIKit

class PromotionModel: NSObject {
    @objc var items: [Promotion] {
        let title = StringResourses.roll_or_pizza_in_present.text.uppercased()
        var image = Icons.first_promotion.image
        return [
            .init(title: title, image: image),
            .init(title: title.uppercased(), image: image),
            .init(title: title.uppercased(), image: image)
        ]
    }
}
