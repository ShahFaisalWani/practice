module.exports = (app) => {
  const books_controller = require("../controllers/addBooks/books.controller");
  const upload = require("multer")({ destination: "/upload" }).single(
    "excel_file"
  );
  var router = require("express").Router();
  router.post("/excel", upload, books_controller.addExcel);
  router.post("/add", books_controller.addtoDB);
  router.post("/addstocks", books_controller.addStocks);
  router.post("/removestocks", books_controller.removeStocks);
  router.post("/addorder", books_controller.addOrder);
  router.get("/supplier/:supplier_name", books_controller.getBooksBySupplier);
  router.get("/search", books_controller.searchBooks);
  router.get("/page", books_controller.getBooksByPage);
  router.get("/ISBN/:ISBN", books_controller.getBookByISBN);
  app.use("/book", router);
};
