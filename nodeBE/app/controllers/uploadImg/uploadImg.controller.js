const sql = require("../../config/db/db.config");

const { uploadGdrive } = require("../../middleware/uploadImg/uploadGdrive");

const uploadImg = async (req, res) => {
  const filepath = await uploadGdrive(req, res);
  const ISBN = req.body.ISBN;
  const q = `UPDATE books SET cover_img = ? WHERE books.ISBN = ?`;
  try {
    sql.query(q, [filepath, ISBN], (res, err) => {
      if (err) console.log(err);
      else console.log(res);
    });
    res.status(200).json({ filepath });
  } catch (err) {
    res.status(500).send({
      message: "Query Error: " + err,
    });
  }
};

module.exports = { uploadImg };
