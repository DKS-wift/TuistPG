import ConfigurationPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription

public extension Project {
    static func module(
        name: String,
        options: Options = .options(),
        packages: [Package] = [],
        settings: Settings = .settings(configurations: .default), // Project의 BuildSettings
        targets: [Target],
        fileHeaderTemplate: FileHeaderTemplate? = nil,
        additionalFiles: [FileElement] = [],
        resourceSynthesizers: [ResourceSynthesizer] = .default // 에셋(폰트,색,이미지) + strings + plists 자동 생성
    ) -> Project {
        return Project(
            name: name, // 모듈이름
            organizationName: env.organizationName, // 올간 이름
            options: options,
            packages: packages,
            settings: settings,
            targets: targets, // 모듈 디펜던시 및 인터페이스 등 Layer 관련 정의
            schemes: targets.contains { $0.product == .app } ? // 스킴
                [.makeScheme(target: .dev, name: name), .makeDemoScheme(target: .dev, name: name)] :
                [.makeScheme(target: .dev, name: name)],
            fileHeaderTemplate: fileHeaderTemplate, // 파일 생성 시 기본 설명 헤더
            additionalFiles: additionalFiles,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}
