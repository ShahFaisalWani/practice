const Member = require("../model/member.model");

const checkMember = (req, res) => {
  const id = req.params.id;
  Member.checkMember(id, (err, data) => {
    if (err) {
      return res.status(500).send({
        message: err.message || "Some error occured while retriveing data.",
      });
    } else {
      const today = new Date(
        new Date().getFullYear(),
        new Date().getMonth(),
        new Date().getDate()
      );
      if (data.length == 0)
        return res.status(404).json({ message: "Member doesn't exist" });
      return res.status(200).json({
        ...data[0],
        status: data[0].end_date < today ? "expired" : "valid",
      });
    }
  });
};

const renewMember = (req, res) => {
  const id = req.params.id;
  Member.renewMember(id, (err, data) => {
    if (err) {
      return res.status(500).send({
        message: err.message || "Some error occured while retriveing data.",
      });
    } else {
      const expire = new Date(data).toLocaleDateString("en-US");
      return res.status(200).json({
        message: `Renewed successfully. Valid until ${expire}`,
      });
    }
  });
};

module.exports = {
  checkMember,
  renewMember,
};
