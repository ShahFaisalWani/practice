const sql = require("../config/db/db.config");

//Constructor
const Member = function (member) {
  this.member_id = member.member_id;
  this.start_date = member.start_date;
  this.end_date = member.end_date;
};

Member.checkMember = (id, result) => {
  const q = `SELECT * FROM members WHERE member_id = '${id}'`;
  sql.query(q, (err, res) => {
    if (err) {
      return result(err, null);
    }
    return result(null, res);
  });
};

Member.renewMember = (id, result) => {
  let start = new Date();
  const temp = new Date().setFullYear(new Date().getFullYear() + 1);
  let expire = new Date(temp);
  start = start.toISOString();
  expire = expire.toISOString();
  const q = `UPDATE members SET start_date = '${start}', end_date = '${expire}' WHERE member_id = '${id}';`;
  sql.query(q, (err, res) => {
    if (err) {
      return result(err, null);
    }
    return result(null, expire);
  });
};

module.exports = Member;
