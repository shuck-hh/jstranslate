# jstranslate
A javascript libary for translating websites

## How to use
1. Take main.js and place it somewhere in your project folder (You probably want to create a folder for that)
2. Create a .txt file in the same directory named `jstranslate_langs.txt`.
3. Fill it with some international language shortcuts (e.g.: `de-DE` or `en`)
4. Then for each language you've put into that file, create a JSON named the same as the language shortcut (again e.g.: `de-DE` or `en`)
5. Fot example, fill the en.json file like this:
```json
[
  {
    "key": ":header:",
    "value": "The English Header"
  },
  {
    "key": ":description:",
    "value": "The english description"
  }
]
```
6. In your HTML, use the key values instead of actual text:
```html
<h1>:header:</h1>
```
7. Place the script file after your website's content. It won't work if you put it into the header
```html
  <body>
  <!--...-->
  <script src="./translate/main.js"/>
  </body>
```
8. You're all set 👍
