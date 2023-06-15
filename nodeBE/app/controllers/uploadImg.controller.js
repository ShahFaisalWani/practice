const sql = require("../config/db/db.config");

const { uploadGdrive } = require("../middleware/uploadImg/uploadGdrive");

const uploadImg = async (req, res) => {
  const filepath = await uploadGdrive(req, res);
  const ISBN = req.body.ISBN;
  const q = `UPDATE books SET cover_img = "${filepath}" WHERE ISBN = "${ISBN}"`;
  try {
    sql.query(q, (res, err) => {
      if (err) console.log(err);
      else console.log("oooooooooo", res);
    });
    res.status(200).json({ filepath });
  } catch (err) {
    res.status(500).send({
      message: "Query Error: " + err,
    });
  }
};

module.exports = { uploadImg };
