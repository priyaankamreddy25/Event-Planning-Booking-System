const express = require("express");
const router = express.Router();
const OrganizerController = require("../controllers/OrganizerController");

router.get("/organizer/:id", OrganizerController.getOrganizerEvents);

module.exports = router;
