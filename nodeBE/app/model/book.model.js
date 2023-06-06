const {
  pagespeedonline,
} = require("googleapis/build/src/apis/pagespeedonline");
const sql = require("../config/db/db.config");

//Constructor
const Book = function (book) {
  this.ISBN = book.ISBN;
  this.title = book.title;
  this.desc = book.desc;
  this.cover_img = book.cover_img;
  this.author = book.author;
  this.publisher = book.publisher;
  this.supplier_name = book.supplier_name;
  this.genre = book.genre;
  this.price = book.price;
  this.weight = book.weight;
};

Book.insert = (values, keys, result) => {
  const q = `INSERT INTO books (${keys.map((col) => col)}) VALUES (?)`;
  sql.query(q, [values], (err, res) => {
    if (err) {
      console.log("Query error: " + JSON.stringify(err));
      return result(err, null);
    }
    console.log("Created book: ", {
      ...values,
    });
    return result(null, {
      message: `Inserted ${res.affectedRows} books successfully`,
    });
  });
  return;
};

Book.addStock = (ISBN, quantity, result) => {
  q =
    "UPDATE stocks SET in_stock = in_stock + ?, total_stock = total_stock + ? WHERE book_ISBN = ?";
  sql.query(q, [quantity, quantity, ISBN], (err, res) => {
    if (err) {
      console.log("Query error: ", err);
      return result(err, null);
    }
    if (res.affectedRows == 0) {
      console.log("book not found");
      return result({ kind: "not_found" }, null);
    }
    // console.log("Add stock ", res);
    return result(null, res);
  });
};

Book.removeStock = (ISBN, quantity, result) => {
  q =
    "UPDATE stocks SET in_stock = in_stock - ?, total_stock = total_stock - ? WHERE book_ISBN = ?";
  sql.query(q, [quantity, quantity, ISBN], (err, res) => {
    if (err) {
      console.log("Query error: ", err);
      return result(err, null);
    }
    if (res.affectedRows == 0 || res == undefined) {
      console.log("book not found");
      return result({ kind: "not_found" }, null);
    }
    // console.log("Return stock ", res);
    return result(null, res);
  });
};

Book.addOrder = (values) => {
  q = "INSERT INTO orders (`customer_id` ,`date`,`total`) VALUES (?)";
  sql.query(q, [values], (err, res) => {
    if (err) {
      console.log("Query error: " + JSON.stringify(err));
    }
    console.log("Added order id: " + res.insertId);
  });
  return;
};

Book.getBySupplier = (supplier_name, result) => {
  sql.query(
    `SELECT book_ISBN FROM stocks WHERE supplier_name = '${supplier_name}'`,
    (err, res) => {
      if (err) {
        console.log("Query error: " + err);
        result(err, null);
        return;
      }
      if (!res.length) {
        result({ kind: "not_found" }, null);
        return;
      }
      result(null, res);
    }
  );
};

Book.getByPage = (limit, result) => {
  const q = `SELECT * FROM books ORDER BY ISBN
  LIMIT ${limit}`;
  sql.query(q, (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      result(err, null);
      return;
    }

    console.log(res.length);
    result(null, res);
  });
};

Book.search = (keyword, result) => {
  const q = `
    SELECT * FROM books
    WHERE title LIKE '%${keyword}%' OR
          author LIKE '%${keyword}%' OR
          genre LIKE '%${keyword}%' OR
          publisher LIKE '%${keyword}%'
  `;

  sql.query(q, (err, res) => {
    if (err) {
      console.log("Query error: " + err);
      result(err, null);
      return;
    }
    if (!res.length) {
      result({ kind: "not_found" }, null);
      return;
    }
    result(null, res);
  });
};

module.exports = Book;
