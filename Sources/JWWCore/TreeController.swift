import Foundation

final class TreeController {
    let rootNode: Node

    init(rootNode: Node) {
        self.rootNode = rootNode
    }
}

final class Node: Hashable {
    let object: Any
    private(set) weak var parent: Node?
    let id: UUID
    var isGroupItem: Bool = false

    private(set) var children: [Node] = []
    var childCount: Int {
        children.count
    }

    var isLeaf: Bool {
        children.isEmpty
    }

    // MARK: Initialization
    // ====================================
    // Initialization
    // ====================================

    init(object: Any, parent: Node?) {
        self.object = object as Any
        self.parent = parent
        self.id = UUID()
    }

    // MARK: Hashable Conformance
    // ====================================
    // Hashable Conformance
    // ====================================

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    class func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
}
