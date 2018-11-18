//
//  ProjectData.swift
//  AEVlist
//
//  Created by Dieter Bergmann on 15.11.18.
//  Copyright © 2018 Dieter Bergmann. All rights reserved.
//

import Foundation
import RealmSwift

class ProjectData: Object {
    @objc dynamic var projectName: String = ""
    @objc dynamic var softwareCycle: String = ""
}
