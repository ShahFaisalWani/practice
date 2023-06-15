module.exports = (app) => {
  const books_controller = require("../controllers/book.controller");
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
  router.get("/ISBN/:ISBN", books_controller.getBookByISBN);
  router.get("/specific", books_controller.getBySpecific);
  router.get("/search", books_controller.searchBooks);
  router.get("/page", books_controller.getBooksByPage);
  router.get("/topsales", books_controller.getTopSales);
  router.get("/table/:name", books_controller.getTableData);

  app.use("/book", router);
};
