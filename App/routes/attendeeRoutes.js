const express = require("express");
const router = express.Router();
const AttendeeController = require("../controllers/AttendeeController");

router.get("/attendees/:eventID", AttendeeController.getAttendeesByEvent);

module.exports = router;
