// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

// packのディレクトリでファイル作成をしましょう。price.js
// ①入力された値を取得して変数に入れる　https://www.sejuku.net/blog/27019　https://master.tech-camp.in/curriculums/4672
