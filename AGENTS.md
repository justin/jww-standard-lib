# Repository Guidelines

## Project Structure & Module Organization

This repository is a Swift Package Manager library whose package and product are
named `JWWCore`. Production code lives in `Sources/JWWCore/`; related extensions
are grouped by subject, such as `Sources/JWWCore/Codable Extensions/`. Tests live
in `Tests/JWWCore-Tests/` and generally mirror the source filename. Package
platforms and targets are declared in `Package.swift`. CI configuration is in
`.github/workflows/ci.yml`, and lint rules are in `.swiftlint.yml`. The project
has no runtime assets or executable target.

## Build, Test, and Development Commands

- `Use `BuildProject` to compile, not shell commands`
- `Run tests with `RunAllTests` or `RunSomeTests`
- Test results available via Xcode's test navigator
- `Use `DocumentationSearch` to find Apple API docs
- WWDC session transcripts are searchable

CI also validates Apple-platform builds with the shared `JWWCore` scheme. Run
the relevant Xcode destination locally when changing availability annotations
or platform-specific code.

## Coding Style & Naming Conventions

Use four-space indentation and follow the surrounding Swift style. Name types
and protocols in `UpperCamelCase`; use `lowerCamelCase` for functions,
properties, and test methods. Keep extension filenames descriptive, following
the existing `Type+Capability.swift` pattern. Prefer focused extensions and
self-documenting APIs. SwiftLint enforces repository-specific limits and
opt-in rules; notably, place `@Test` on the line above its declaration.

## Testing Guidelines

Add tests for every behavior change and regression fix. Use Swift Testing
(`import Testing`, `@Test`, `#expect`, and `#require`) for all unit tests. Do not
add tests using XCTest. Name test functions to describe the observable
behavior. There is no declared coverage threshold, but new public helpers
should cover success cases and relevant edge cases.

## Commit & Pull Request Guidelines

Follow the existing history: use a concise, capitalized, imperative summary
such as `Add Int convenience helpers`, without a trailing period. Keep commits
focused on one change. Pull requests should explain the motivation and API or
platform impact, list the validation performed, and link any related issue.
Include screenshots only when a change has a visible UI or documentation
rendering impact. Ensure tests and SwiftLint pass before requesting review.
