/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import Shared

@objc public protocol MenuHelperInterface {
    @objc optional func menuHelperCopy(_ sender: Notification)
    @objc optional func menuHelperOpenAndFill(_ sender: Notification)
    @objc optional func menuHelperReveal(_ sender: Notification)
    @objc optional func menuHelperSecure(_ sender: Notification)
    @objc optional func menuHelperFindInPage(_ sender: Notification)
}

open class MenuHelper: NSObject {
    open static let SelectorCopy: Selector = #selector(MenuHelperInterface.menuHelperCopy(_:))
    open static let SelectorHide: Selector = #selector(MenuHelperInterface.menuHelperSecure(_:))
    open static let SelectorOpenAndFill: Selector = #selector(MenuHelperInterface.menuHelperOpenAndFill(_:))
    open static let SelectorReveal: Selector = #selector(MenuHelperInterface.menuHelperReveal(_:))
    open static let SelectorFindInPage: Selector = #selector(MenuHelperInterface.menuHelperFindInPage(_:))

    open class var defaultHelper: MenuHelper {
        struct Singleton {
            static let instance = MenuHelper()
        }
        return Singleton.instance
    }

    open func setItems() {
        let revealPasswordTitle = Strings.RevealPassword
        let revealPasswordItem = UIMenuItem(title: revealPasswordTitle, action: MenuHelper.SelectorReveal)

        let hidePasswordTitle = Strings.HidePassword
        let hidePasswordItem = UIMenuItem(title: hidePasswordTitle, action: MenuHelper.SelectorHide)

        let copyTitle = Strings.Copy
        let copyItem = UIMenuItem(title: copyTitle, action: MenuHelper.SelectorCopy)

        let openAndFillTitle = Strings.Open_and_Fill
        let openAndFillItem = UIMenuItem(title: openAndFillTitle, action: MenuHelper.SelectorOpenAndFill)

        let findInPageTitle = Strings.Find_in_Page
        let findInPageItem = UIMenuItem(title: findInPageTitle, action: MenuHelper.SelectorFindInPage)

        UIMenuController.shared.menuItems = [copyItem, revealPasswordItem, hidePasswordItem, openAndFillItem, findInPageItem]
    }
}
