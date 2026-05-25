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
  const response = await fetch("./jstranslate_langs.txt");
  const text = await response.text();

  return text//.split("\n");
}

async function main() {
  const items = await loadList();
  const language = navigator.language;

  console.log(items);

  if (items.includes(language)) {
    const languageJSON = await getLanguageJSON(language);
    for (let i = 0, len = languageJSON.length; i < len; i++) {
      replaceTextEverywhere(languageJSON[i].key, languageJSON[i].value)
    }
  }
}


async function getLanguageJSON(language) {
  const response = await fetch("./" + language + ".json");
  return await response.json();
}

main();