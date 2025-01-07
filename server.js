const express = require("express");
const app = express();
const port = 3000;

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

app.use(express.static(__dirname + "/test"));

app.get("/", (req, res) => {
  res.send("");
});

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});
