import ProjectDescription
import ConfigurationPlugin

/// 실질적으로 외부 라이브러리를 정의하는 곳

/* 버전 관리
 
 - `upToNextMajor(from: ProjectDescription.Version)` : **{Major}.0.0** 부터 **{Major+1}.0.0** 이전까지의 버전을 사용합니다. (1.0.0 ~ 2.0.0)
 
 - `upToNextMinor(from: ProjectDescription.Version)` : **{Major}:{Minor}.0** 부터  **{Major}:{Minor+1}.0** 이전까지의 버전을 사용합니다. (1.0.0 ~ 1.1.0)
 
 - `range(from: ProjectDescription.Version, to: ProjectDescription.Version)` : from부터 to 까지의 버전을 사용합니다.
 
 - `exact(ProjectDescription.Version)` : 특정 버전을 사용합니다.
 
 - `branch(String)` : 특정 브랜치를 기준으로 Package를 가져와 사용합니다.
 
 - `revision(String)` : 특정 커밋을 기준으로 Package를 가져와 사용합니다.
 
 */
let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            //.remote(url: "https://github.com/airbnb/lottie-ios.git", requirement: .exact("4.2.0")),
          .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.24.0"))
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .dev),
                .debug(name: .stage),
                .release(name: .prod)
            ]
        )
    ),
    platforms: [.iOS]
)
