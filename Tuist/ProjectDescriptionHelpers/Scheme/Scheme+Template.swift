import ProjectDescription
import ProjectDescriptionHelpers


/*
  Scheme = 앱을 빌드해서 실행할 때 필요한, 미리 정의해 놓은 설정들의 집합
 
 설정이란?
 
    1. 프로젝트에서 빌드될 타겟들을 정의하는 설정
    2. 사용할 빌드 configuration을 정의하는 설정
    3. 프로덕트가 실행될 때 사용할 실행 가능한 환경을 정의하는 설정
 
 */

extension Scheme {
    
    /// 앱 스킴 만드는 함수
    /// - Parameters:
    ///   - target: 빌드 될  프로덕트 (DEV,STAGE,PROD)
    ///   - name: 스킴이름
    /// - Returns: 스킴
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    
    /// 데모 앱 스킴 만드는 함수
    /// - Parameters:
    ///   - target: 빌드 될  프로덕트 (DEV,STAGE,PROD)
    ///   - name: 스킴이름
    /// - Returns: 스킴
    static func makeDemoScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)Demo"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)Demo"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
