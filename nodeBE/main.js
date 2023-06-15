const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();

global.__basedir = __dirname;

var corsOptions = {
  origin: "*",
};

app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get("/", (req, res) => {
  res.send("hi");
});

require("./app/routes/book.routes")(app);
require("./app/routes/member.routes")(app);
require("./app/routes/uploadImg.routes")(app);

app.listen(3000, (req, res) => {
  console.log("listening on port 3000");
});
