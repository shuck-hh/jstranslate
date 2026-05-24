function replaceTextEverywhere(searchText, replaceText) {
    const walker = document.createTreeWalker(
        document.body,
        NodeFilter.SHOW_TEXT
    );

    let node;

    while ((node = walker.nextNode())) {
        node.nodeValue = node.nodeValue.replaceAll(searchText, replaceText);
    }
}

// Beispiel
replaceTextEverywhere("Hallo", "Welt");