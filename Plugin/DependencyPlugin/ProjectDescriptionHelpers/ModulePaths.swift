import Foundation

// swiftlint: disable all
public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case shared(Shared)
    case userInterface(UserInterface)
}

extension ModulePaths: MicroTargetPathConvertable {
    public func targetName(type: MicroTargetType) -> String {
        switch self {
        case let .feature(module as any MicroTargetPathConvertable),
            let .domain(module as any MicroTargetPathConvertable),
            let .core(module as any MicroTargetPathConvertable),
            let .shared(module as any MicroTargetPathConvertable),
            let .userInterface(module as any MicroTargetPathConvertable):
            return module.targetName(type: type)
        }
    }
}

/*
  모듈은 총 5가지 case가 존재한다.
 
 */

public extension ModulePaths {
    // 사용자의 액션을 처리하거나 데이터를 보여주는, 사용자와 직접 맞닿는 레이어
    enum Feature: String, MicroTargetPathConvertable {
        case BaseFeature
    }
}

public extension ModulePaths {
    // 도메인 로직이 진행되는 레이어
    enum Domain: String, MicroTargetPathConvertable {
        case BaseDomain
    }
}

public extension ModulePaths {
    
    //앱의 비즈니스를 포함하지 않고 순수 기능성 모듈이 위치한 레이어
    enum Core: String, MicroTargetPathConvertable {
        case CoreKit
    }
}

public extension ModulePaths {
    
    //로깅, extension 등 모든 레이어에서 공용으로 재사용될 모듈이 위치한 레이어
    enum Shared: String, MicroTargetPathConvertable {
        case GlobalThirdPartyLibrary
    }
}

public extension ModulePaths {
    
    //공용 View, 디자인 시스템, 리소스 등 UI 요소 모듈이 위치한 레이어
    enum UserInterface: String, MicroTargetPathConvertable {
        case DesignSystem
    }
}

//
public enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
    case unitTest = "Tests"
    case demo = "Demo"
}

public protocol MicroTargetPathConvertable {
    func targetName(type: MicroTargetType) -> String
}

public extension MicroTargetPathConvertable where Self: RawRepresentable {
    
    ///  최종 마이크로 모듈 형태
    /// - Parameter type: 마이크로 타겟
    /// - Returns: 모듈이름 + 마이크로 타겟이름
    func targetName(type: MicroTargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}
