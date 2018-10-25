//
//  Typealias.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

typealias CompletionSuccess = (_ success: Bool) -> Void
typealias ModelListHandler = (_ page: Int, _ totalPages: Int, _ models: [ModelProtocol], _ success: Bool) -> Void
typealias PushWithModel = (_ viewModel: ListViewModelProtocol) -> Void
typealias AlertWithMessage = (_ Message: String) -> Void
