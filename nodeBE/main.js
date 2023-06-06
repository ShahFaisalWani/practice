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

require("./app/routes/books.routes")(app);
require("./app/routes/uploadImg.routes")(app);

// app.post("/add", (req, res) => {
//   const keys = Object.keys(req.body[0]);
//   const data = req.body;
//   let values = data.map((obj) => keys.map((key) => obj[key]));
//   console.log(data, keys);
//   const q = `INSERT INTO books (${keys.map((col) => col)}) VALUES ?`;
//   mysql.query(q, [values], (res, err) => {
//     if (err) console.log(err);
//     else console.log(res);
//   });
// });

app.listen(3000, (req, res) => {
  console.log("listening on port 3000");
});
