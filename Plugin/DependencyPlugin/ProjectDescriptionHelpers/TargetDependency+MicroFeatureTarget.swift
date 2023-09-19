import Foundation
import ProjectDescription


// 해당 모듈을 반환함
public extension TargetDependency {
    
    ///  퓨처 모듈 반환
    static func feature(
        target: ModulePaths.Feature,
        type: MicroTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToFeature(target.rawValue)
        )
    }

    ///  도메인 모듈 반환
    static func domain(
        target: ModulePaths.Domain,
        type: MicroTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToDomain(target.rawValue)
        )
    }

    ///  코어 모듈 반환
    static func core(
        target: ModulePaths.Core,
        type: MicroTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToCore(target.rawValue)
        )
    }

    ///  공용 모듈 반환
    static func shared(
        target: ModulePaths.Shared,
        type: MicroTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToShared(target.rawValue)
        )
    }

    ///  UI 모듈 반환
    static func userInterface(
        target: ModulePaths.UserInterface,
        type: MicroTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToUserInterface(target.rawValue)
        )
    }
}
