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

const language = navigator.language;

console.log(language);

async function loadList() {
  const response = await fetch("/list.txt");
  const text = await response.text();

  return text.split("\n");
}

async function main() {
  const items = await loadList();

  console.log(items);

  doSomething(items);
}

function doSomething(items) {
  console.log(items[0]);
}

main();