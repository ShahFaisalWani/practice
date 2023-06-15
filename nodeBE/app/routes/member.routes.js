module.exports = (app) => {
  const member_controller = require("../controllers/member.controller");
  var router = require("express").Router();
  router.get("/check/:id", member_controller.checkMember);
  router.get("/renew/:id", member_controller.renewMember);
  app.use("/member", router);
};
