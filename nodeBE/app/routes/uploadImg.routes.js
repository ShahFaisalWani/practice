module.exports = (app) => {
  const uploadImg_controller = require("../controllers/uploadImg.controller");
  const upload = require("multer")({ destination: "/upload" }).single(
    "cover_img"
  );
  var router = require("express").Router();
  router.post("/book_cover", upload, uploadImg_controller.uploadImg);
  app.use("/upload", router);
};
