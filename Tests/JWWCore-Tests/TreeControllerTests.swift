import Foundation
import Testing
@testable import JWWCore

/// Tests for the `TreeController` actor.
struct TreeControllerTests {
    @Test("Initialization")
    func initialization() {
        let root = Node(object: "Root Node", parent: nil)
        let treeController = TreeController(rootNode: root)

        #expect(treeController.rootNode == root)
    }

    @Suite("Node Tests")
    struct NodeTests {
        @Test("Initialization with parent node")
        func initializationWithParentNode() throws {
            let parent = Node(object: "Hi There", parent: nil)
            let node = Node(object: "Test Init Node", parent: parent)

            #expect(node.parent == parent)
            #expect(node.object is String)
            #expect(node.object as? String == "Test Init Node")
        }

        @Test("Initialization without a parent node")
        func initializationWithoutParentNode() throws {
            let node = Node(object: "Test Init Node", parent: nil)

            #expect(node.parent == nil)
            #expect(node.object is String)
            #expect(node.object as? String == "Test Init Node")
        }
    }
}

// MARK: Test Types
// ====================================
// Test Types
// ====================================

private enum SidebarSection: Int, CaseIterable {
    case filters
    case tags

    nonisolated var title: String {
        switch self {
        case .filters:
            return String(localized: "content-list-item-filter-section-header")
        case .tags:
            return String(localized: "content-list-item-tags-section-header")
        }
    }
}

private struct SidebarItemIdentifier: Identifiable, Hashable, Sendable {
    enum Identifier: Hashable, Sendable {
        case all
        case stillImages
        case gifs
        case videos
        case allTags
        case tag(UUID)

#if os(macOS)
        case section(SidebarSection)
#endif

        var rawValue: String {
            switch self {
            case .all:
                return "all"
            case .stillImages:
                return "stillImages"
            case .gifs:
                return "gifs"
            case .videos:
                return "videos"
            case .allTags:
                return "allTags"
            case .tag(let id):
                return id.uuidString
            case .section(let section):
                return section.title
            }
        }
    }
    static let filtersSection = SidebarItemIdentifier(id: .section(.filters), title: SidebarSection.filters.title, systemImageName: "folder")
    static let tagsSection = SidebarItemIdentifier(id: .section(.tags), title: SidebarSection.tags.title, systemImageName: "tag")

    static let all = SidebarItemIdentifier(id: .all, title: String(localized: "content-list-item-all-reactions"), systemImageName: "folder")
    static let images = SidebarItemIdentifier(id: .stillImages, title: String(localized: "content-list-item-still-images"), systemImageName: "photo")
    static let gifs = SidebarItemIdentifier(id: .gifs, title: String(localized: "content-list-item-gifs"), systemImageName: "memories")
    static let videos = SidebarItemIdentifier(id: .videos, title: String(localized: "content-list-item-videos"), systemImageName: "film")

    static let allTags = SidebarItemIdentifier(id: .allTags, title: String(localized: "content-list-all-tags-item"), systemImageName: "tag")

    let id: Identifier
    let title: String
    let systemImageName: String

    init(id: Identifier, title: String, systemImageName: String) {
        self.id = id
        self.title = title
        self.systemImageName = systemImageName
    }
}

private protocol SidebarItemNode: AnyObject {
    var id: SidebarItemIdentifier.Identifier { get }
    var isLeaf: Bool { get }
    var isGroupItem: Bool { get }
    var childCount: Int { get }
    var children: [SidebarItemNode] { get }

    var item: SidebarItemIdentifier { get }
}

extension SidebarItemNode {
    var id: SidebarItemIdentifier.Identifier {
        item.id
    }

    var rowHeight: CGFloat {
        isGroupItem ? 24.0 : 28.0
    }

    var childCount: Int {
        children.count
    }

    var isGroupItem: Bool {
        if case .section = item.id {
            return true
        } else {
            return false
        }
    }

    var isLeaf: Bool {
        !isGroupItem
    }
}

private final class MyReactionsSectionNode: SidebarItemNode {
    let item: SidebarItemIdentifier = .filtersSection
    let children: [SidebarItemNode] = [
        AllReactionsItemNode(),
        StillImagesItemNode(),
        GIFsItemNode(),
        VideosItemNode()
    ]
}

private final class AllReactionsItemNode: SidebarItemNode {
    let item: SidebarItemIdentifier = .all
    let children: [SidebarItemNode] = [ ]
}

private final class StillImagesItemNode: SidebarItemNode {
    let item: SidebarItemIdentifier = .images
    let children: [SidebarItemNode] = [ ]
}

private final class GIFsItemNode: SidebarItemNode {
    let item: SidebarItemIdentifier = .gifs
    let children: [SidebarItemNode] = [ ]
}

private final class VideosItemNode: SidebarItemNode {
    let item: SidebarItemIdentifier = .videos
    let children: [SidebarItemNode] = [ ]
}

private final class TagsSectionNode: SidebarItemNode {
    let item: SidebarItemIdentifier = .tagsSection
    private(set) var children: [SidebarItemNode] = [ ]

    init(count: Int) {
        for index in 0..<count {
            let tag = Tag(name: "Tag \(index)")
            let tagNode = TagItemNode(tag: tag)
            children.append(tagNode)
        }
    }
}

private final class Tag: Identifiable {
    let id: UUID
    let name: String

    init(name: String) {
        self.name = name
        self.id = UUID()
    }
}

private final class TagItemNode: SidebarItemNode {
    let item: SidebarItemIdentifier
    let children: [SidebarItemNode] = []

    init(tag: Tag) {
        item = SidebarItemIdentifier(id: .tag(tag.id), title: tag.name, systemImageName: "tag")
    }
}
