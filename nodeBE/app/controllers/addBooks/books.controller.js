const sql = require("../../config/db/db.config");
const Book = require("../../model/book.model");
const fs = require("fs");
const XLSX = require("xlsx");
const { execSync } = require("child_process");

const addExcel = (req, res) => {
  const file = req.file;

  if (!file) {
    return res.status(400).json({ message: "No file uploaded" });
  }

  const workbook = XLSX.read(file.buffer, { type: "buffer" });

  const outputWorkbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(
    outputWorkbook,
    workbook.Sheets[workbook.SheetNames[0]],
    "Sheet1"
  );
  XLSX.writeFile(outputWorkbook, "temp.xlsx");

  try {
    const output = execSync(`py ./getColumn.py temp.xlsx`).toString().trim();
    const json = JSON.parse(output);
    res.status(200).json(json.matches);
    console.log("Columns filtered successfully!");
  } catch (error) {
    console.error("Error executing Python script:", error);
  }
  fs.unlinkSync("temp.xlsx");
};

const addtoDB = (req, res) => {
  console.log(req.body);
  const allKeys = Object.keys(req.body[0]);
  let clone = [];
  for (let i = 0; i < req.body.length; i++) {
    let { quantity, ...rest } = req.body[i];
    clone.push(rest);
  }
  const keys = Object.keys(clone[0]);
  const data = clone;
  let values = data.map((obj) => keys.map((key) => obj[key]));

  let resLog = [];
  let errLog = [];

  for (let i = 0; i < req.body.length; i++) {
    // const bookObj = new Book({
    //   ISBN: data[i].ISBN,
    //   title: data[i].title,
    //   desc: data[i].desc,
    //   cover_img: data[i].cover_img,
    //   author: data[i].author,
    //   publisher: data[i].publisher,
    //   supplier_name: data[i].supplier_name,
    //   genre: data[i].genre,
    //   price: data[i].price,
    //   weight: data[i].weight,
    // });
    Book.insert(values[i], keys, (err, data) => {
      if (err) {
        if (err.code === "ER_DUP_ENTRY") {
          errLog.push({ message: `Book ${values[i][0]} already existed` });
        } else {
          errLog.push({ message: err });
        }
      } else {
        // res.send(data.message);
        resLog.push(values[i][0]);
        console.log(values[i] + "success");
      }
      if (i === req.body.length - 1) {
        res.status(200).send({ errLog: errLog, resLog: resLog });
      }
    });
    if (allKeys.includes("quantity")) {
      Book.addStock(req.body[i]["ISBN"], req.body[i]["quantity"]);
    }
  }
};

const addStocks = (req, res) => {
  let resLog = [];
  let errLog = [];
  for (let i = 0; i < req.body.length; i++) {
    const ISBN = req.body[i].book_ISBN;
    const quantity = req.body[i].quantity;

    Book.addStock(ISBN, quantity, (err, data) => {
      if (err) {
        if (err.kind == "not_found")
          errLog.push({ message: `Book id ${ISBN} not found` });
        errLog.push(err.sqlMessage);
      } else {
        resLog.push({ message: `Added ${quantity} books of id ${ISBN}` });
      }
      if (i == req.body.length - 1) {
        return res.status(200).send({ errLog: errLog, resLog: resLog });
      }
    });
  }
};

const removeStocks = (req, res) => {
  let resLog = [];
  let errLog = [];
  for (let i = 0; i < req.body.length; i++) {
    const ISBN = req.body[i].book_ISBN;
    const quantity = req.body[i].quantity;

    Book.removeStock(ISBN, quantity, (err, data) => {
      if (err) {
        if (err.kind == "not_found")
          errLog.push({ message: `Book id ${ISBN} not found` });
        errLog.push(err.sqlMessage);
      } else {
        resLog.push({ message: `Returned ${quantity} books of id ${ISBN}` });
      }
      if (i == req.body.length - 1) {
        return res.status(200).send({ errLog: errLog, resLog: resLog });
      }
    });
  }
};

const addOrder = (req, res) => {
  try {
    req.body.map((order) => {
      Book.addOrder(Object.values(order));
    });
    res.status(200).json({ message: `Added ${req.body.length} orders` });
  } catch (err) {
    res.status(500).json({ err });
  }
};

const getBooksBySupplier = (req, res) => {
  const supplier_name = req.params.supplier_name;
  Book.getBySupplier(supplier_name, (err, data) => {
    if (err) {
      if ((err.message = "Supplier doesn't exist")) {
        res.status(200).send([{}]);
        return;
      }
      res.status(500).send({
        message: err.message || "Some error occured while retriveing data.",
      });
    } else {
      res.status(200).json(data);
    }
  });
};

const getBooksByPage = (req, res) => {
  try {
    const limit = req.query.limit;
    Book.getByPage(limit, (err, data) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occured while retriveing data.",
        });
      } else {
        res.status(200).json(data);
      }
    });
  } catch (err) {
    console.log(err);
  }
};

const searchBooks = (req, res) => {
  const keyword = req.query.keyword;
  Book.search(keyword, (err, data) => {
    if (err) {
      if ((err.kind = "not_found")) {
        res.status(200).send([{}]);
        return;
      }
      res.status(500).send({
        message: err.message || "Some error occured while retriveing data.",
      });
    } else {
      res.status(200).json(data);
    }
  });
};

module.exports = {
  addExcel,
  addtoDB,
  addStocks,
  removeStocks,
  addOrder,
  getBooksBySupplier,
  searchBooks,
  getBooksByPage,
};