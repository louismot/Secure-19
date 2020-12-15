var express = require('express');
var app = express();
app.use(express.static('src'));
app.use(express.static('../secure19-contract/build/contracts'));
app.get('/', function (req, res) {
  res.render('src/App.vue');
});
app.listen(8000, function () {
  console.log('Example app listening on port 8000!');
});