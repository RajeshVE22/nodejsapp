'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = 'localhost';

// App
const app = express();
// app.get('/', (req, res) => {
//   res.send('Hello World');
// });

app.get('/', function(req, res){
  res.sendFile(__dirname + '/public/index.html');
})

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});

/////https://www.youtube.com/watch?v=vm3YfOHf_Cc