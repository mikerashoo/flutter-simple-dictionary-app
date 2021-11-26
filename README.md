# flutter_simple_dictionary_app

Flutter based dictionary app.

## Getting Started
- create words.db database file using other tools (I used db browser )
- create table words with columns of languages(I used three language kafinoonoo, amharic, english), id, type (to identify noun, verb...)
- clone the repo
- copy words.db file to asset
- change word model properties with your prefered languages (mine is String kafinoonoo, String english, String amharic) add if necessary
- Track all occurance of word and replace all word.kafinoonoo property with your main language (for eg. if it is english change word.kafinoonoo with word.english)
-  Replace all other languages with yours in all word object existance
-  go to word_detail_screen.dart and navigate rows of word and meaning replace with language name for first child and word.language for second  
-     (eg. Text("English") with Text("Spanish") and Text(word.english!) with Text(word.spanish!)
-  run app
