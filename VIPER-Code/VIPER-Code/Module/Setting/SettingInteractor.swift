//
//  SettingInteractor.swift
//  VIPER-Code
//
//  Created giftbot on 2017. 10. 15..
//  Copyright © 2017년 giftbot. All rights reserved.
//

import Foundation

protocol SettingInteractorInputProtocol: class {
  // Presenter -> Interactor
  var currentSetting: ServiceSetting { get }
  var settingHeaders: [String] { get }
  var settingValues: [[String]] { get }
  
  func setServiceSettingForValue(at indexPath: IndexPath)
}

// MARK: - Class Implementation

final class SettingInteractor: SettingInteractorInputProtocol {
  
  typealias Language = ServiceSetting.Language
  typealias UserID   = ServiceSetting.UserID
  typealias SortType = ServiceSetting.SortType
  
  // MARK: Properties
  
  weak var presenter: SettingInteractorOutputProtocol!
  var currentSetting: ServiceSetting
  
  let settingHeaders = ["\(Language.self)", "\(UserID.self)", "\(SortType.self)"]
  let settingValues = [
    Language.allValues.map { "\($0)" },
    UserID.allValues.map { "\($0)" },
    SortType.allValues.map { "\($0)" }
  ]
  
  // MARK: Initialize
  
  init(serviceSetting: ServiceSetting) {
    currentSetting = serviceSetting
  }

  // MARK: SettingInteractorInputProtocol

  func setServiceSettingForValue(at indexPath: IndexPath) {
    if indexPath.section == settingHeaders.index(of: "\(Language.self)") {
      currentSetting.language = Language.allValues[indexPath.row]
    } else if indexPath.section == settingHeaders.index(of: "\(UserID.self)") {
      currentSetting.userID = UserID.allValues[indexPath.row]
    } else {
      currentSetting.sortType = SortType.allValues[indexPath.row]
    }
  }
}
